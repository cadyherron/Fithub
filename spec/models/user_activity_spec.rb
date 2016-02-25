require 'rails_helper'

describe UserActivity do

  let(:user){ create(:user)}
  let(:activity){ create(:activity)}

  let(:user_activity){ build(:user_activity, :user => user, :activity => activity) }

  describe 'valid_default_user_activity' do 

    it "is valid with default attributes" do
      expect(user_activity).to be_valid
    end
  end

  describe 'validates_intensity' do

   it "does not allow intensity to be value other in Low Medium or High" do
        new_user_activity = build(:user_activity, :intensity => 'foo')
        expect(new_user_activity).not_to be_valid
      end
  end

  describe 'validates_calories' do  
   
    it "does not allow negative calories" do
        new_user_activity = build(:user_activity, :calories => -1)
        expect(new_user_activity).not_to be_valid
    end

    it "does not allow calories > 2000" do
        new_user_activity = build(:user_activity, :calories => 2001)
        expect(new_user_activity).not_to be_valid
    end
  end

  describe 'validates_duration' do  
    it "does not allow duration > 5000" do
        new_user_activity = build(:user_activity, :duration_minutes => 5001)
        expect(new_user_activity).not_to be_valid
    end

  end

  describe 'validates_activity' do  
    it "does not allow non-existent activity" do
        new_user_activity = build(:user_activity, :activity_id => 5001)
        expect(new_user_activity).not_to be_valid
    end

  end

  describe 'validates_user' do  
    it "does not allow non-existent user" do
        new_user_activity = build(:user_activity, :user_id => 5001)
        expect(new_user_activity).not_to be_valid
    end

  end

  describe 'creates_nultiple_activities_for_user'  do  
    it "creates 5 same activity times for a user " do
      new_activities = create_list(:user_activity, 5, user: user)
      expect(user.user_activities.count).to eq(5)
    end

  end

end
