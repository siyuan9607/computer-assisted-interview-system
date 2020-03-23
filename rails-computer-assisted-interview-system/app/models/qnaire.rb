class Qnaire < ActiveRecord::Base
  has_many :qstates
  has_many :qsteps, :through=>:qstates
  belongs_to :qformat
    #has_one :current, class_name:"Qstep"
end
