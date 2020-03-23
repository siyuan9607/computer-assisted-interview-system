class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :qstep, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true
    end
  end
end
