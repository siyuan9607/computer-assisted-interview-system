 class ProjectsController < ApplicationController
       def project_params
           params.require(:project).permit(:name,:entry_time,:sql_link)
       end
       
       def show
       end
       
       def new
          @project = Project.new
       end
       
       def create
           @project = Project.new(project_params)
           if @project.save
              flash[:notice] = "#{@project.name} has been added to the system"
              redirect_to root_path
           else
              render 'new'
           end
       end
       
       def show_users
          @user_assigned = User.where(:project_id == params[:id])
          @user_free = User.where(:project_id == NIL)
       end

       def destroy
           
       end
end