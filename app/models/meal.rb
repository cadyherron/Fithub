class Meal < ActiveRecord::Base
  belongs_to :user
  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods


  def total_calories
    self.foods.inject(0) {|sum, food| sum += (food.quantity.to_i * food.calories.to_i) }
  end
end
