class ChangeCaloriesToInteger < ActiveRecord::Migration
  def change
    remove_column :foods, :calories
    add_column :foods, :calories, :integer
  end
end
