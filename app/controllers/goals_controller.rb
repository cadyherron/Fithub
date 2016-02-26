class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      flash[:notice] = "Goal created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:goal_type,:target_amount,:end_date)
  end

end
