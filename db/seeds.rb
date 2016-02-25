# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all


# change this number to scale amount of seeds
MULTIPLIER = 1



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