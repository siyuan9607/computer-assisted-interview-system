class CreateQformats < ActiveRecord::Migration
  def change
    create_table :qformats do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
