FactoryGirl.define do
  factory :goal do
    user
    target_amount 8
    end_date Date.today + 3
    goal_type "Calories Burned"
  end
end
