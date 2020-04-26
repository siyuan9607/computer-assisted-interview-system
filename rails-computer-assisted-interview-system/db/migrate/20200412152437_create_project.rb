class CreateProject < ActiveRecord::Migration
    def change
        create_table :projects do |t|
          t.string :name,         null: false, default: ""
          t.datetime :entry_time, null: false, default: ""
          t.string :sql_link
        end
    end
end