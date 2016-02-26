require 'rails_helper'

describe MealsController do

  let(:user) { create(:user) }
  let(:create_food) { create( :food ) }
  let(:create_meal) { create( :meal ) }
  let(:good_search) { "cucumbers" }
  let(:bad_search) { "" }

  before :each do
    user
    controller.send( :sign_in, user ) 
    request.env['HTTP_REFERER'] = root_url
  end

  describe "GET #new" do
    xit "redirects to meal" do
      get :new
      expect(response).to redirect_to( meal_path( create_meal.id - 1) )
    end
  end

  describe "PUT #update" do
    xit "redirects to meal" do
      patch :update
      expect(response).to render_template( :update )
    end
  end


  # describe "POST #search" do
  #   it "adds 1 to meal foods" do
  #     post :search, { 
  #         :food_search => bad_search, :meal_id => create_meal.id }
  #     expect(response).to redirect_to( :back )
  #   end

  #   it "ridirects to meal" do
  #     #attributes_for is FactoryGirl method
  #     post :search, { 
  #         :food_search => good_search, :meal_id => create_meal.id }

  #     expect(response).to render_template( :search )
  #   end
  # end

end