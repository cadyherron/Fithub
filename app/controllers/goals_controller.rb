class GoalsController < ApplicationController

  def index
    @available_goals = current_user.goals.available
    @unavailable_goals = current_user.goals.unavailable
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      flash[:notice] = "Goal created successfully!"
      redirect_to goals_path
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:goal_type,:target_amount,:end_date)
  end

end
