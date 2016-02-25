require 'rails_helper'

require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into                :webmock
end


feature 'User creates a meal' do


  let(:user) { create(:user) }

  before do
    visit root_path
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_on("Log in")
  end


  scenario 'they search for meal items' do
    VCR.use_cassette("apple") do
      visit new_meal_path
      find('#food_search').set('apple')
      click_button "Search"
      expect(page).to have_selector('#food_name[value="Apple - 1 cup slices"]') 
    end
    
  end

end
