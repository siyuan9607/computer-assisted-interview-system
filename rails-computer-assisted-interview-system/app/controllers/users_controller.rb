class UsersController < ApplicationController
    def user_params
       params.require(:user).permit(:name,:email,:password,:role,:project_id)
    end
   
   def show
       @user = User.find(params[:id])
       project_id =@user.project_id
       if project_id !=NIL
           @project = Project.find(project_id)
       end
   end
   
   def new
      @user = User.new
   end
   
   
   def create
       @user = User.new(user_params)
       if @user.save
          flash[:notice] = "#{@user.name} has been added to the system"
          redirect_to root_path
       else
          render 'new'
       end
   end
   
    def assign
          user_name = params[:user_name]
          @user = User.find_by(name: user_name)
          project_name = params[:project_name]
          @project = Project.find_by(name: project_name)
          @user.update!(project_id: @project.id)
          flash[:notice] = "#{@user.name} has been assigned to #{@project.name}"
          redirect_to show_users_path :id => @project.id
    end
   
   def disassign
          user_email = params[:user_email]
          @user = User.find_by(email: user_email)
          id = @user.project_id
          @user.update!(project_id: NIL)
          redirect_to show_users_path :id => id
   end      
   
   def edit
      @user = User.find(params[:id])
   end
  
   def update
       @user = User.find(params[:id])
       if @user.update_attributes(user_params)
           flash[:notice] = "#{@user.name} has been updated in the system"
           redirect_to root_path
       else
           render 'edit'
       end
   end
   
   def destroy
       @user = User.find(params[:id])
       if @user.role == "admin"
            flash[:notice] = "#{@user.name} cannot be deleted"
       else
            @user.destroy
            flash[:notice] = "#{@user.name} has been deleted from the system"
       end
       redirect_to root_path 
   end
   
end