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

    it "does not allow intensity to be empty" do
      new_user_activity = build(:user_activity, :intensity => '')
      expect(new_user_activity).not_to be_valid
    end

   it "does allow not intensity to be nil" do
      new_user_activity = build(:user_activity, :intensity => nil)
      expect(new_user_activity).to_not be_valid
    end

    it "does allow intensity to be High" do
      new_user_activity = build(:user_activity, :intensity => 'High')
      expect(new_user_activity).to be_valid
    end

    it "does allow intensity to be Medium" do
      new_user_activity = build(:user_activity, :intensity => 'Medium')
      expect(new_user_activity).to be_valid
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

    it "auto populates calories to 0 if it was nil" do
        new_user_activity = build(:user_activity, :calories => nil)
        expect(new_user_activity).to be_valid
    end

  end

  describe 'validates_duration' do  
    it "does not allow duration > 5000" do
        new_user_activity = build(:user_activity, :duration_minutes => 5001)
        expect(new_user_activity).not_to be_valid
    end
    
    it "auto populates duration to 0 if it was nil" do
        new_user_activity = build(:user_activity, :duration_minutes => nil)
        expect(new_user_activity).to be_valid
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

  describe 'creates_multiple_activities_for_user'  do  
    it "creates 5 same activities for a user " do
      new_activities = create_list(:user_activity, 5, user: user)
      expect(user.user_activities.count).to eq(5)
    end

    it "creates 2 different activities for a user " do
      activity2 = create(:activity, name: "treadmill")
      create(:user_activity, activity: activity, user: user)
      create(:user_activity, activity: activity2, user: user)
      expect(user.user_activities.count).to eq(2)
    end

  end

  describe 'calculates correct workout calorie totals'  do  
    it "calculates correct workout totals for today  " do
      new_activities = create_list(:user_activity, 5, user: user)
      new_activities = create_list(:user_activity, 5, user: user, :created_at => 3.days.ago, calories: 300)
      sum = UserActivity.user_calories_for_today(user,scope="today")
      expect(sum).to eq(500)
    end
  
    it "calculates correct workout calorie totals to-date " do
      new_activities = create_list(:user_activity, 5, user: user)
      new_activities = create_list(:user_activity, 5, user: user, :created_at => 3.days.ago, calories: 300)
      sum = UserActivity.user_calories_for_today(user,scope="to-date")
      expect(sum).to eq(2000)
    end
  end

  describe 'calculates correct workout duration totals'  do  
    it "calculates correct workout duration totals for today  " do
      new_activities = create_list(:user_activity, 5, user: user, duration_minutes: 10)
      new_activities = create_list(:user_activity, 5, user: user, :created_at => 3.days.ago, duration_minutes: 30)
      sum = UserActivity.user_minutes_for_today(user,scope="today")
      expect(sum).to eq(50)
    end
  
    it "calculates correct workout duration totals to-date " do
      new_activities = create_list(:user_activity, 5, user: user, duration_minutes: 10)
      new_activities = create_list(:user_activity, 5, user: user, :created_at => 3.days.ago, duration_minutes: 30)
      sum = UserActivity.user_minutes_for_today(user,scope="to-date")
      expect(sum).to eq(200)
    end
  end
  
end