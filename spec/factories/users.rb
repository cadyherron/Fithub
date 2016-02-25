FactoryGirl.define do
  factory :user do
    first_name "jim"
    last_name "smith"
    sequence(:email) { |n| "foo#{n}@bar.com"}
    password "football"
    password_confirmation "football"
  end
end
