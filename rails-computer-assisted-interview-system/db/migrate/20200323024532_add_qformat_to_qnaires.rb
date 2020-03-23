class AddQformatToQnaires < ActiveRecord::Migration
  def change
    add_reference :qnaires, :qformat, index: true, foreign_key: true
  end
end
