class User < ActiveRecord::Base
  include Searchable
  include Analytics

  has_attached_file :avatar, :styles => { :large => "500x500", :medium => "350x350", :thumb => "200x200" }, default_url: 'user_silhouette_generic.gif'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :in => 0.megabytes..2.megabytes


  has_many :meals, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :foods, through: :meals
  has_many :user_activities, -> { order('created_at DESC') }


  before_create :generate_token

  has_secure_password
  validates :email, email: true, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { in: 0..20}
  validates :email, length: { in: 0..40}

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
    meals.where(created_at: start_date..end_date).joins(:foods).sum("calories * quantity")
  end

  def total_calories
    self.meals.inject(0) {|sum, meal| sum += meal.total_calories }
  end

  def total_calories_burned
    self.user_activities.sum(:calories)
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

  def avg_calories_per_day
    meals.where("meals.created_at >= ?", self.created_at.strftime("%F")).joins(:foods).sum(:calories) / -(self.created_at.midnight - DateTime.now).to_i
  end

  def self.order_by_calories_burned
    User.joins(:user_activities).group('users.id').order('sum(calories) DESC').select('sum(calories), users.*')
  end


  def self.order_by_calories_consumed
    User.joins(:meals).joins(:foods).group('users.id').order('sum(calories) DESC').select('sum(calories), users.*')
  end

  def self.avg_calories_consumed_per_day(user)
    sums = self.select("SUM(quantity * calories) as total, cast(users.created_at as date) AS dt").joins("JOIN meals ON users.id = meals.user_id").joins("JOIN foods ON foods.meal_id = meals.id").where("users.id = #{user.id}").group("cast(users.created_at as date)")
    from(sums).select("dt, AVG(total) as avg").group("dt")
  end
end
