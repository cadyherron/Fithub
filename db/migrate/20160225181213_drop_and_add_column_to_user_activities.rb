class DropAndAddColumnToUserActivities < ActiveRecord::Migration
  def change
   remove_column :user_activities, :duartion_minutes 
   add_column :user_activities, :duration_minutes, :integer
  end
end
