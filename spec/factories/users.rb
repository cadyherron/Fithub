FactoryGirl.define do
  factory :user do
    first_name "jim"
    last_name "smith"
    sequence(:email) { |n| "foo#{n}@bar.com"}
    password "football"
    password_confirmation "football"
  end

  factory :user_with_no_password, :class => :user do
    name  "No Password"
    email "nopasword@aol.com"
  end
  
end
