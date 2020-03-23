class Qstep < ActiveRecord::Base
  has_many :qnaires, :through => :qstates
  has_many :qstates
  has_and_belongs_to_many :options, class_name:"Qstep",
                          join_table: :options,
                          foreign_key: :qstep_id,
                          association_foreign_key: :option_id
end
