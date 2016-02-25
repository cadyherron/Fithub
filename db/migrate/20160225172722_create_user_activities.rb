class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer  :user_id 
      t.integer  :activity_id 
      t.string   :intensity
      t.integer  :duartion_minutes
      t.integer  :calories
      t.timestamps null: false
    end
  end
end
