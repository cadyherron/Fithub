== Welcome to Fithub!

Live website hosted on Heroku:


To run locally:
1. fork and clone this repo
2. run `bundle exec figaro install` and put ENV variables into application.yml
3. `rake db:create`, `rake db:seed`

run `rails s`, thenvisit localhost:3000
create an account


To run the test suite:
1. from root directory, run `rspec`
2. to have guard running in the background, `bundle exec guard init`, then `bundle exec guard`
