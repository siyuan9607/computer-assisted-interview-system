class Optrecord < ActiveRecord::Base
  belongs_to :qnaire
  belongs_to :qstep
end
