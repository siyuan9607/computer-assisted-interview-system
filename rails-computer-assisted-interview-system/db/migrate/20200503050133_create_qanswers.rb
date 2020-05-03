class CreateQanswers < ActiveRecord::Migration
  def change
    create_table :qanswers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
