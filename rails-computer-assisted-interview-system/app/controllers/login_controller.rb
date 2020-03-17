# created by Somyung Oh
class LoginController < ApplicationController
    def show
    end
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:login][:email])
        if user && params[:login][:password] == user.password
            flash[:notice] ="you have been logged in"
            redirect_to root_path
        else
            flash[:notice] ="users does not found in the system"
            redirect_to enroll_path
        end
    end
    
end