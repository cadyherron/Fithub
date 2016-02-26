class UserActivity < ActiveRecord::Base
  include Analytics

  belongs_to :activity
  belongs_to :user
  
  validates :duration_minutes, inclusion: { in: 0..1000 }, :allow_nil => true
  validates :intensity, inclusion: { in: %w(Low Medium High),
                        message: "%{value} is not a valid intensity"}
  validates :calories, inclusion: { in: 0..2000 }, :allow_nil => true
 
  validates :user, presence: true
  validates :activity, presence: true

  def self.user_activties_for_today(user)
    today = Time.new.strftime('%Y-%m-%d')
    user.user_activities.where("created_at.strftime('%Y-%m-%d')" == today)
  end 



end
