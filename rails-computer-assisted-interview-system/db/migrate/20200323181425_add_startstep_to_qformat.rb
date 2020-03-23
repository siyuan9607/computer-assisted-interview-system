class AddStartstepToQformat < ActiveRecord::Migration
  def change
    add_reference :qformats, :startstep, index: true, foreign_key: true
  end
end
