class Qstate < ActiveRecord::Base
  belongs_to :qstep
  belongs_to :qnaire
end
