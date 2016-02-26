FactoryGirl.define do

  factory :user_activity do
    calories 100
    duration_minutes 30
    intensity "Low"
    user
    activity 

  end

  factory :user_activity_ago, :class => :user_activity do
    calories 100
    duration_minutes 30
    intensity "Low"
    created_at 1.day.ago
    user
    activity 
  end
  

end
