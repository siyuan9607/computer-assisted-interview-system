class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :role
    end
    
    add_index :users, :name
    add_index :users, :email
    add_index :users, :password
    add_index :users, :role
  end
end
