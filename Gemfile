source 'https://rubygems.org'

gem 'rails', '4.2.5.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'httparty'
gem 'bcrypt', '~> 3.1.7'
gem 'faker'

group :production do
  gem 'rails_12factor'
  gem 'daemons'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'brakeman', require: false
  gem 'rubocop', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'vcr'
  gem 'webmock'
end

group :development, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem "letter_opener"
end

gem 'binding_of_caller'
gem 'figaro'
gem 'bootstrap-sass'
gem 'delayed_job_active_record'
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '>= 2.0.0'
gem 'inline_svg'
gem 'simple_form'
gem 'bootstrap-datepicker-rails'
gem 'cancancan'
gem 'email_validator'
