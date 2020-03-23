class AddQformatToQsteps < ActiveRecord::Migration
  def change
    add_reference :qsteps, :qformat, index: true, foreign_key: true
  end
end
