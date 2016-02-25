class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :first_name,    null: false
      t.string      :last_name,    null: false
      t.string      :email,         null: false
      t.string      :password_digest
      t.string      :auth_token, :string
      t.timestamps null: false
    end

    add_index :users, :auth_token, :unique => true
  end
end
