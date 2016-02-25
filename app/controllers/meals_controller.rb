class MealsController < ApplicationController

  def new
    @meal = Meal.create
    redirect_to @meal
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
  end

  private

  def meal_params
    params.require(:meal).permit(foods_attributes: [ :name, :calories, :quantity ] )
  end
end
