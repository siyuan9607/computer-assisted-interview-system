class CreateOptrecords < ActiveRecord::Migration
  def change
    create_table :optrecords do |t|
      t.references :qnaire, index: true, foreign_key: true
      t.references :qstep, index: true, foreign_key: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
