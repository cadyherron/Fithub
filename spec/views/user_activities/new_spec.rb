
require 'rails_helper'

describe "user_activities/new.html.erb" do

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


  it "does render new workout form" do
    
    assign(:user, users[0])     
    assign(:user_activities, user_activities) 
    assign(:user_activity, build(:user_activity))

    render template: 'user_activities/new'

    expect(rendered).to have_content('Log your workout')

  end

end