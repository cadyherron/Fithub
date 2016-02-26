FactoryGirl.define do

  factory :user_activity do
    calories 100
    duration_minutes 30
    intensity "Low"
    user
    activity 

  end

end
