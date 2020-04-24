class AddFormatToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :qformat, foreign_key: true
  end
end
