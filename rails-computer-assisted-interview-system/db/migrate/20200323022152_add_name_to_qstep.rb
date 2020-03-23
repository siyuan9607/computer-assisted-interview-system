class AddNameToQstep < ActiveRecord::Migration
  def change
    add_column :qsteps, :name, :string
  end
end
