require 'rails_helper'



describe UserActivitiesController do

  describe 'with_logged_in_user' do
    let(:user){ create(:user) }
    let(:user_activity){ create(:user_activity, user: user) }

  before :each do
    request.cookies["auth_token"] = user.auth_token
  end

  describe "POST #create" do

    it "valid with default params" do
      #attributes_for is FactoryGirl method
      post :create, :user_activity => attributes_for( :user_activity )
      expect(response).to redirect_to user_activitry_path( assigns(:user_activity) )
    end

    it "unsuccessful create renders new" do
      post :create, :user_activity => attributes_for( :user_activity, :user => nil )

      expect(response).to render_template(:new)
    end
  end




end

