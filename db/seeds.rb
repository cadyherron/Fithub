# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Delete old data"
Activity.delete_all

puts "Creating activities"

Activity.create(name: "running", calories_per_hour: 800)
Activity.create(name: "treadmill", calories_per_hour: 750)
Activity.create(name: "hiking", calories_per_hour: 650)
Activity.create(name: "jumping rope", calories_per_hour: 960)
Activity.create(name: "swimming", calories_per_hour: 950)

puts "Created activities.."