require 'rails_helper'

feature 'User creates a meal' do

  xscenario 'they search for meal items' do
    visit new_meal_path
    fill_in 'Food search', with: 'Apple'
    save_and_open_page
    click_button "Search"

    expect(page).to have_content 'Apple'
  end

end
