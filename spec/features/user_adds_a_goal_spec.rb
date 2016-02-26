require 'rails_helper'

feature 'Users adds a goal' do

  let(:user) { create(:user) }

  before do
    visit root_path
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_on("Log in")
  end

  scenario 'add a goal' do
    visit new_goal_path
    select 'Calories Burned', from: 'Goal type'
    fill_in 'Target amount', with: '500'
    first('input#goal_end_date', visible: false).set(Date.tomorrow.to_s)
    click_button 'Create Goal'

    expect(page).to have_content 'Goal created'
  end

end

