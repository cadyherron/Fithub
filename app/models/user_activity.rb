class UserActivity < ActiveRecord::Base

  before_create :fill_in_nill

  include Analytics

  belongs_to :activity
  belongs_to :user

  validates :duration_minutes, inclusion: { in: 0..1000 }, :allow_nil => true
  validates :intensity, inclusion: { in: %w(Low Medium High),
                        message: "%{value} is not a valid intensity"}
  validates :calories, inclusion: { in: 0..2000 }, :allow_nil => true

  validates :user, presence: true
  validates :activity, presence: true

  def self.user_activities_for_today(user)
    today = Time.new.strftime('%Y-%m-%d')
    user.user_activities.where("created_at.strftime('%Y-%m-%d')" == today)
  end 

  def self.user_calories_for_today(user,scope="today")
    if scope == "today"
      activities = UserActivity.user_activities_for_today(user)
    else
      activities =user.user_activities
    end  
    activities.inject(0) {|sum, activity| sum += activity.calories }

  end

  def self.user_minutes_for_today(user,scope="today")
    if scope == "today"
      activities = UserActivity.user_activities_for_today(user)
    else
      activities =user.user_activities
    end  
    activities.inject(0) {|sum, activity| sum += activity.duration_minutes }
    
  end

  def fill_in_nill
    if self.calories.nil?
       self.calories = 0
    end
    
    if self.duration_minutes.nil?
       self.duration_minutes = 0
    end
  end 

end
