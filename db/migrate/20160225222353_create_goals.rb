class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :target_amount
      t.datetime :end_date
      t.string :goal_type

      t.timestamps null: false
    end
  end
end
