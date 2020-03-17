class UsersController < ApplicationController
   
   def user_params
       params.require(:user).permit(:name,:email,:password,:role)
   end
   
   def show
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
   
   def destroy
       @user = User.find(params[:id])
       @user.destroy
       flash[:notice] = "#{@user.name} has been delelted from the system"
       redirect_to root_path
   end
end