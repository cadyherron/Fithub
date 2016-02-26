require 'rails_helper'

describe UsersController do

  describe "POST #create" do

    it "successful create redirects to user show page" do
      #attributes_for is FactoryGirl method
      post :create, :user => attributes_for( :user )
      expect(response).to redirect_to root_path
    end

    it "unsuccessful create renders user new page" do
      #attributes_for is FactoryGirl method
      post :create, :user => attributes_for( :user_with_no_password )
      expect(response).to render_template(:new)
    end

  end

  describe "Logged In User" do

    let(:user) { create(:user) }
    # let(:user_2) { create(:user) }

    before :each do
      request.cookies["auth_token"] = user.auth_token
    end

    # it "can PATCH request to #update" do
    #   patch :update, { id: user.id, user: { first_name: "ASDF" } }
    #   expect(response).to redirect_to redirect_to user_path( assigns(:user) )
    # end

    # it "bad params to PATCH request to #update redirects to edit" do
    #   patch :update, { id: user.id, user: { password: "" } }
    #   expect(response).to render_template( :edit )
    # end

  end

end
