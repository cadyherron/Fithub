require 'rails_helper'



describe UserActivitiesController do

  describe 'with_logged_in_user' do
    let(:user){ create(:user) }
    let(:user_activity){ create(:user_activity, user: user) }
    let(:activity){ create(:activity) }


    before :each do
      request.cookies["auth_token"] = user.auth_token
      request.env['HTTP_REFERER'] = user_url(user)
    end

    describe "POST #create" do

      xit "valid with default params" do
        post :create, :user_activity => attributes_for( :user_activity, :activity_id => activity.id ).except( :user )
        expect(flash[:success]).to_not be(nil)
      end

      xit "valid with default params" do
        post :create, :user_activity => attributes_for( :user_activity )
        expect(response).to redirect_to( :back )
      end

      xit "unsuccessful create flashes error" do
        post :create, :user_activity => attributes_for( :user_activity, :user => nil )

        expect(flash[:error]).to_not eq(nil)
      end
    end

   describe "DELETE #destroy" do
      xit "destroys activity of valid user" do
        delete :destroy, :user_activity => attributes_for( :user_activity )
        expect(flash[:success]).to_not eq(nil)
      end

      xit "flases error not invalid user" do
        delete :destroy, :user_activity => attributes_for( :user_activity, :user => nil )

        expect(flash[:error]).to_not eq(nil)
      end
    end

  end
end

