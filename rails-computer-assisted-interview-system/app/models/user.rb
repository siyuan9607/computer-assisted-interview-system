class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def user_params
    params.require(:user).permit( :email, :name, :role)
  end
  
  def self.role
     return ['supervisor','interviewer']
  end
end

