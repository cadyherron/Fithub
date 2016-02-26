# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# change this number to scale the amount of seed data
MULTIPLIER = 1



puts "Delete old data"
Activity.delete_all
UserActivity.delete_all
Food.delete_all
Meal.delete_all
User.delete_all



puts "Creating activities..."

Activity.create(name: "running", calories_per_hour: 800)
Activity.create(name: "treadmill", calories_per_hour: 750)
Activity.create(name: "hiking", calories_per_hour: 650)
Activity.create(name: "jumping rope", calories_per_hour: 960)
Activity.create(name: "swimming", calories_per_hour: 950)





puts "Creating users..."

def create_user
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, 
    password_digest: "$2a$10$.MSTCUKj.7tpap8LswJXa.AeTlsa9Qmh0TWTcYJjqZd8bhMokgPbO"
    )
end

(MULTIPLIER*10).times do
  create_user
end

# create admin user that never changes 
User.create(
  first_name: "Admin", 
  last_name: "User", 
  email: "admin@admin.com", 
  password_digest: "$2a$10$.MSTCUKj.7tpap8LswJXa.AeTlsa9Qmh0TWTcYJjqZd8bhMokgPbO"
)


puts "Creating user_activities..."

(MULTIPLIER*10).times do
  UserActivity.create(
    user_id: User.pluck(:id).sample,
    activity_id: Activity.pluck(:id).sample,
    intensity: ["Low", "Medium", "High"].sample,
    calories: rand(1..600),
    duration_minutes: rand(1..120)
    )
end



puts "Creating meals..."

(MULTIPLIER*10).times do 
  Meal.create(
    meal_type: ["Breakfast", "Snack", "Lunch", "Dinner"].sample,
    user_id: User.pluck(:id).sample
  )
end




puts "Creating foods for meals..."

(MULTIPLIER*2).times do
  Meal.all.each do |meal|
  Food.create(
    name: Faker::Beer.name,
    calories: rand(1..600),
    sodium: rand(1..600),
    brand: Faker::Company.name,
    meal_id: meal.id,
    quantity: rand(1..10)
    )
  end
end





puts "DONE!"