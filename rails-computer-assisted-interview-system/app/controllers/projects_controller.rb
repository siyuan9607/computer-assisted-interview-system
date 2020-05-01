class ProjectsController < ApplicationController
  def project_params
    params.require(:project).permit(:name,:entry_time,:last_updated_time)
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
    #@project = Project.new
  end

  def create
    qfid=Qformat.form_format(:project.format_text)
    if qfid.is_a? String
      flash[:notice] = qfid
      redirect_to root_path
    end

    @project = Project.new
    @project.name=:project.name
    @project.entry_time=:project.entry_time
    @project.id=qfid

    if Qformat.first !=NIL
      @project.qformat_id=Qformat.first.id
    end
    if @project.save
      flash[:notice] = "#{@project.name} has been added to the system"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = "#{@project.name} has been updated in the system"
      redirect_to root_path
    else
      render 'edit'
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
    id = params[:id]
    @project = Project.find(id)
    @users = User.where(:project_id => id)
    for user in @users
      user.update!(project_id: NIL)
    end
    @project.destroy
    flash[:notice] = "#{@project.name} has been deleted from the system"
    redirect_to root_path
  end
end