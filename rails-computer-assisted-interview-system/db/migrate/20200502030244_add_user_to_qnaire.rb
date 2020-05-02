class AddUserToQnaire < ActiveRecord::Migration
  def change
    add_reference :qnaires, :user
  end
end
