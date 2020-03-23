class AddStatusToQnaires < ActiveRecord::Migration
  def change
    add_column :qnaires, :status, :integer
  end
end
