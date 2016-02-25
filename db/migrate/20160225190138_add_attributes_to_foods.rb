class AddAttributesToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :meal, index: true, foreign_key: true
    add_column :foods, :quantity, :decimal, precision: 8, scale: 2, default: 1
  end
end
