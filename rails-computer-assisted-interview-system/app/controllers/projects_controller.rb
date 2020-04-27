 class ProjectsController < ApplicationController
       def project_params
           params.require(:project).permit(:name,:entry_time,:sql_link)
       end
       
       def index
         if user_signed_in?
           @projects= Project.all
         else
           redirect_to new_user_session_path
         end
       end
       
       def current_project
            @project = Project.find_by(params[:id])
       end
       
       def new
          @project = Project.new
       end
       
       def create
           @project = Project.new(project_params)
           @project.qformat_id=Qformat.first.id
           if @project.save
              flash[:notice] = "#{@project.name} has been added to the system"
              redirect_to root_path
           else
              render 'new'
           end
       end
       

       def show
          id = params[:id]
          @project = Project.find(id)
          @user_free = User.where(:project_id=>NIL)
          @user_assigned = User.where(:project_id=>id)
          @interviews = Qnaire.where(:qformat_id => @project.qformat_id)
          @qf = @project.qformat_id
       end
       

       def destroy
           
       end
end