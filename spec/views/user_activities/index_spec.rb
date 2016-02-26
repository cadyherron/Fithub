# spec/views/users/index_spec.rb
require 'rails_helper'

describe "user_activities/index.html.erb" do

  let(:users){create_list(:user, 2)}
  let(:user_activities){create_list(:user_activity, 5, user: users[0])}

  before :each do
    def view.signed_in_user?
      true
    end

    def view.current_user
      @user
    end

  end

  it "does show the total user calories" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content('Total Calories Burned: 500')

  end

  it "does show the total user workout minutes" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content('Total Workout Minutes: 150')

  end


  it "does show 6 remove buttons for the 5 activities and header" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content('Remove', count: 6)

  end

  it "does show 5 activitiy names for the 5 activities " do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content('running', count: 5)

  end


  it "does show 5 calorie fields for the 5 activities" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content(100, count: 5)

  end

  it "does show 5 minutes fields for the 5 activities" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_content(30, count: 5)

  end

  it "does show link to new workout" do

    assign(:users, users)
    assign(:user_activities, user_activities)
    assign(:user_calories, 500)
    assign(:user_minutes, 150)

    render

    expect(rendered).to have_css('input.btn-default.btn-xl', count: 1)

  end

end