class Addcolumntomeals < ActiveRecord::Migration
  def change
    add_column :meals, :user_id, :integer
  end
end
