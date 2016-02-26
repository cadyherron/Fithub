class DashboardController < ApplicationController
  include Analytics

  before_action :require_login


  def index
    @recent_meals = current_user.meals.limit(5)
    @recent_workouts = current_user.user_activities.limit(5)
    @recent_goals = current_user.goals.available.limit(5)
  end



  def require_login
    unless signed_in_user?
      redirect_to login_path
    end
  end

end
