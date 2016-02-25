class UserActivitiesController < ApplicationController

  def index
    #@user_id = params[:user_id]
    @user_id = 1
    @user_activities = UserActivity.where("user_id = ?", @user_id)
    #should be  @user_activities = @user.user_activities
  end

  def new
    @user_id = params[:user_id]
    @user_activity = UserActivity.new
    @user_activities = UserActivity.where("user_id = ?", @user_id)
    #@user_activities = UserActivity.where(.strftime("%Y-%m-%d")
  end
  
  def create
    user_id = params[:user_id]
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user_id = user_id

    if @user_activity.save
      flash[:success] = "Activity Logged!"
      redirect_to new_user_activity_path(user_id: user_id)
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
