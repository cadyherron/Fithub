class FoodsController < ApplicationController
  load_and_authorize_resource :meal
  load_and_authorize_resource through: :meal

  def search
    @meal = Meal.find(params[:meal_id])
    if params[:food_search].empty?
      flash[:alert] = "Must enter search term."
      redirect_to :back
    end
    @food_search = params[:food_search]
    @foods = Nutritionix.new.search(@food_search)
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @food = @meal.foods.build(food_params)
    if @food.save
      redirect_to @meal
    else
      render :new
    end
  end

  def new
    @meal = Meal.find(params[:meal_id])
    @food = @meal.foods.build
  end

  def edit
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = "Food updated!"
      redirect_to @meal
    else
      flash[:alert] = "Food could not be updated"
      render :edit
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
