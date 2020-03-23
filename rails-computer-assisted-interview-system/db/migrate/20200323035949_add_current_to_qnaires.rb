class AddCurrentToQnaires < ActiveRecord::Migration
  def change
    add_reference :qnaires, :current, index: true, foreign_key: true
  end
end
