==
Welcome to Fithub!
==

<a href="https://codeclimate.com/github/cadyherron/Fithub"><img src="https://codeclimate.com/github/cadyherron/Fithub/badges/gpa.svg" /></a>

Live website hosted on Heroku:

http://stormy-reef-98752.herokuapp.com/


Feature highlights:
* secure login
* can track meals & workouts
* calorie values for over 500,000 food items


Fancy Rails things:

* delayed job welcome emails
* HTTParty hits Nutritionix API
* test coverage with FactoryGirl + Capybara
* VCR gem for API call playback



To run locally:

1. fork and clone this repo
2. run `bundle exec figaro install` and put ENV variables into application.yml
3. `rake db:create`, `rake db:migrate`, `rake db:seed`
4. run `rails s`, then visit localhost:3000



To run the test suite:

1. from root directory, run `rspec`
2. to have guard running in the background, `bundle exec guard init`, then `bundle exec guard`
