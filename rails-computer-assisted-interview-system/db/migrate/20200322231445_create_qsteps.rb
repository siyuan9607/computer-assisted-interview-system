class CreateQsteps < ActiveRecord::Migration
  def change
    create_table :qsteps do |t|
      t.integer :type
      t.string :document

      t.timestamps null: false
    end
  end
end
