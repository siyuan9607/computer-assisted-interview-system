class Qformat < ActiveRecord::Base
  has_many :qnaires
  has_many :qsteps
end
