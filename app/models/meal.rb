class Meal < ActiveRecord::Base
  enum meal_types: ["Breakfast", "Brunch", "Lunch", "Dunch", "Linner", "Dinner", "Dinfast", "Snack", "Snunch"]
  belongs_to :user
  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods
  validates :meal_type, inclusion: { in: Meal.meal_types , message: 'Nice try, YOU SNEAKY SNEAK!'}


  def total_calories
    self.foods.inject(0) {|sum, food| sum += (food.quantity.to_i * food.calories.to_i) }
  end
end
