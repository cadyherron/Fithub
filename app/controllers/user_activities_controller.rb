class UserActivitiesController < ApplicationController

  before_action :require_login

  def index
    @user_activities = current_user.user_activities
  end

  def new
    @user_activity = UserActivity.new
    @user_activities = UserActivity.user_activties_for_today(current_user)
  end
  
  def create
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user_id = current_user.id

    if @user_activity.save
      flash[:success] = "Activity Logged!"
      redirect_to :back
    else    
      flash[:error] = "Activity could not be logged!"
      render :new
    end

  end
  

  def destroy
    
    user_activity = UserActivity.find(params[:id])

    if user_activity.destroy
      flash[:success] = "Activity was removed!" 
      redirect_to :back
    else    
      flash[:error] = "Activity could not be removed!"
      redirect_to :back
    end

  end


  private
  def user_activity_params
      params.require(:user_activity).permit(
        :activity_id,
        :duration_minutes,
        :calories,
        :intensity
      )
    end
end
