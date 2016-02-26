class FoodsController < ApplicationController

  def search
    @meal = Meal.find(params[:meal_id])
    if params[:food_search].empty?
      flash[:alert] = "Must enter search term."
      redirect_to :back
    end
    @food_search = params[:food_search]
    @foods = Nutritionix.new.search(@food_search)
  end

  def add_to_meal
    @meal = Meal.find(params[:meal_id])
    food = @meal.foods.build(food_params)
    if food.save
      redirect_to @meal
    else
      redirect_to :back
    end
  end

  def edit
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to @meal
    else
      redirect_to :back
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to :back
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories, :quantity)
  end
end
