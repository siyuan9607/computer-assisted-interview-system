class AddCountToQanswer < ActiveRecord::Migration
  def change
    add_column :qanswers, :count, :integer
  end
end
