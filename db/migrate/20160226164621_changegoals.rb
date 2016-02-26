class Changegoals < ActiveRecord::Migration
  def change
    remove_foreign_key :goals, :users
    add_foreign_key :goals, :users, on_delete: :cascade
  end
end
