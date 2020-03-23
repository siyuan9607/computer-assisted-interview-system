class CreateQnaires < ActiveRecord::Migration
  def change
    create_table :qnaires do |t|

      t.timestamps null: false
    end
  end
end
