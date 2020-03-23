class CreateQstates < ActiveRecord::Migration
  def change
    create_table :qstates do |t|
      t.string :answer
      t.references :qnaire, index: true, foreign_key: true
      t.references :qstep, index: true, foreign_key: true
    end
  end
end
