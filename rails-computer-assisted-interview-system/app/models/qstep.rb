class Qstep < ActiveRecord::Base
  has_many :qnaires, :through => :qstates
  has_many :qstates
  has_many :options
end
