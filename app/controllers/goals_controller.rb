class GoalsController < ApplicationController
  load_and_authorize_resource

  def index
    @available_goals = current_user.goals.available
    @unavailable_goals = current_user.goals.unavailable
  end

  def new
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

  def destroy
    if @goal.destroy
      flash[:notice] = "Goal destroyed!"
    end
    redirect_to :back
  end

  private

  def goal_params
    params.require(:goal).permit(:goal_type,:target_amount,:end_date)
  end

end
