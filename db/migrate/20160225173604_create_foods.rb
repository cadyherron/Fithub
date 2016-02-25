class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :calories
      t.string :sodium
      t.string :brand

      t.timestamps null: false
    end
  end
end
