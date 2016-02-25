class Meal < ActiveRecord::Base
  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods
end
