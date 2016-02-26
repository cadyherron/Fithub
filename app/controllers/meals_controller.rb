class MealsController < ApplicationController
  load_and_authorize_resource

  def index
    @meals = current_user.meals
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.build(meal_params)
    if @meal.save
      redirect_to @meal
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to :back
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_type, foods_attributes: [ :name, :calories, :quantity ] )
  end
end
