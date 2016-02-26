require 'rails_helper'

feature 'Users adds a goal' do

  scenario 'add a goal' do
    visit new_goal_path
    fill_in 'Goal type', with: 'Calories Burned'
    fill_in 'Target amount', with: '500'
    fill_in 'Target date', with: '1 week from today'
    click_button 'Create Goal'

    expect(page).to have_content 'Goal created'
  end

end

