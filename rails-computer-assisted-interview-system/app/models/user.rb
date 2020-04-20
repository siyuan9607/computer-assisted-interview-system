class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :project
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
  
  def self.role
     return ['supervisor','interviewer']
  end
  def self.find_user(id)
          target = User.find(id)
          return target
  end
end

