# created by Somyung Oh
class LoginController < ApplicationController
    def show
    end
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            flash[:notice] ="you have been logged in"
            redirect_to enroll_path
        else
            flash[:notice] ="users does not found in the system"
            redirect_to root_path
        end
    end
    
end