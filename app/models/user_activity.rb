class UserActivity < ActiveRecord::Base
  before_create :fill_in_nill

  include Analytics

  belongs_to :activity
  belongs_to :user

  validates :intensity, inclusion: { in: %w(Low Medium High),
                        message: "%{value} is not a High, Low or Medium intensity"}
  validates :intensity, presence:true
  validates :activity_id, presence:true
  validates :calories, numericality: { greater_than: 0, less_than: 999999 }
  validates :duration_minutes, numericality: { greater_than: 0, less_than: 999 }

  validates :user, presence: true
  validates :activity, presence: true

  def self.user_activities_for_today(user)
    today = Time.new.beginning_of_day
    user.user_activities.where("created_at >= ?", today)
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
