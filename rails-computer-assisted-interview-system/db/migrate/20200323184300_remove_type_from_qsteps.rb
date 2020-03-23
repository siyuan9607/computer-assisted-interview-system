class RemoveTypeFromQsteps < ActiveRecord::Migration
  def change
    remove_column :qsteps, :type, :integer
  end
end
