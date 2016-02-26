class Food < ActiveRecord::Base
  belongs_to :meal
  validates :name, length: { in: 1..50}
  validates :calories, numericality: { greater_than: 0, less_than: 999999 }
  validates :quantity, numericality: { greater_than: 0, less_than: 99 }

  def all_calories_all_users
    sum(:calories)
  end
end
