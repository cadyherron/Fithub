class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :meal_type

      t.timestamps null: false
    end
  end
end
