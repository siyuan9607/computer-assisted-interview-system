# created by Somyung Oh
class HomeController < ApplicationController
    def index
        if user_signed_in?
           if current_user.role == 'supervisor' or current_user.role == 'admin'
              @users= User.where(:role => 'interviewer')
           else    
              redirect_to qnaires_path
           end
        else
           redirect_to new_user_session_path
        end
    end
    
    def show
    end
    
    def new
    end
    
    #def create
       # user = User.find_by(email: params[:login][:email])
       # if user && params[:login][:password] == user.password
           # flash[:notice] ="you have been logged in"
           # redirect_to root_path
       # else
           # flash[:notice] ="users does not found in the system"
            #redirect_to enroll_path
        #end
    #  end
    
end