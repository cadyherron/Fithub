class User < ActiveRecord::Base
  include Searchable
  include Analytics

  has_attached_file :avatar, :styles => { :large => "500x500", :medium => "350x350", :thumb => "200x200" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :meals, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :foods, through: :meals
  has_many :user_activities


  before_create :generate_token

  has_secure_password
  validates :email, email: true
  validates :first_name, :last_name, :email, presence: true

  validates :password,
            :length => {:in => 6..40 },
            :allow_nil => true

  def full_name
    first_name + " " + last_name
  end

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  def calories_burned(start_date,end_date)
    user_activities.where(created_at: start_date..end_date).sum(:calories)
  end

  def calories_consumed(start_date,end_date)
    meals.where(created_at: start_date..end_date).joins(:foods).sum("CAST(calories AS FLOAT)")
  end

  def total_calories
    self.meals.inject(0) {|sum, meal| sum += meal.total_calories }
  end

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end

  def photo_url(url)
    if url =~ URI::regexp
      self.avatar = open(url)
    end
  end

end
