FactoryGirl.define do
  
  factory :activity do

    name "running"
    calories_per_hour 800
  
  end

  factory :activity_treadmill , :class => :activity do
    name  "treadmill"
    calories_per_hour 750
  end
  
end
