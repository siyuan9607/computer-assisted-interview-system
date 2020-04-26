 class RelationshipController < ApplicationController
     
    def assign
       @user = User.find_by(params[:user_email])
       @project =Project.find_by(params[:project_id])
       flash[:notice] = "#{@user.name} has been assigned to #{@project.name}"
       redirect_to show_users_path
       
    end
 end