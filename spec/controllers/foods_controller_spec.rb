require 'rails_helper'

describe FoodsController do

  let(:user) { create(:user) }
  let(:create_food) { create( :food ) }
  let(:create_meal) { create( :meal ) }
  let(:good_search) { "cucumbers" }
  let(:bad_search) { "" }

  before :each do
    user
    controller.send( :sign_in, user )
    WebMock.disable!
    request.env['HTTP_REFERER'] = root_url

  end

  describe "POST #create" do

    xit "adds 1 to meal foods" do
      #attributes_for is FactoryGirl method
      expect{
        post :create, { :food => attributes_for( :food ), :meal_id => create_meal.id }
        }.to change( create_meal.foods, :count ).by(1)
    end

    xit "ridirects to meal" do
      post :create, { :food => attributes_for( :food ), :meal_id => create_meal.id }

      expect(response).to redirect_to( meal_path( create_meal.id ))
    end
  end

  describe "POST #search" do
    it "bad search redirects back" do
          # VCR.use_cassette(:bad_search) do
        post :search, { 
            :food_search => bad_search, :meal_id => create_meal.id }
        expect(response).to redirect_to( :back )
      # end
    end

    xit "good search renders search" do
      #attributes_for is FactoryGirl method
      post :search, { 
          :food_search => good_search, :meal_id => create_meal.id }

      expect(response).to render_template( :search )
    end
  end

end
