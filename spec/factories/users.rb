FactoryGirl.define do
  factory :user do
    first_name  "Foo"
    last_name   "Bar"
    email       "foo@bar.com"  
    password    "password" 
  end
end
