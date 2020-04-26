class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :qstep, index: true, foreign_key: true
      t.references :qstep2, index: true, foreign_key: true
      t.string :noticestr

      t.timestamps null: false
    end
  end
end
