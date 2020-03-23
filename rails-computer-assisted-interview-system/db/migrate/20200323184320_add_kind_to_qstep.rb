class AddKindToQstep < ActiveRecord::Migration
  def change
    add_column :qsteps, :kind, :integer
  end
end
