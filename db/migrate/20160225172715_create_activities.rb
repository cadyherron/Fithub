class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string   :name
      t.integer  :calories_per_hour
      t.timestamps null: false
    end
  end
end
