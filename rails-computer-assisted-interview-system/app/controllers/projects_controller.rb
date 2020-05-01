class ProjectsController < ApplicationController
  def project_params
    params.require(:project).permit(:name,:entry_time,:last_updated_time)
  end

  def form_format(form_str)
    form_str=form_str.split("\n")
    status=Array.new(form_str.length)
    aff=Array.new(form_str.length)
    step_n=0
    step_s=Array.new
    for i in 0..form_str.length-1
      if form_str[i] =~ /num:\d+/
        status[i]=0
        aff[i]=/num:(\d+)/.match(form_str[i]).captures[0]
        step_n=step_n+1
        step_s.append i
      elsif form_str[i] =~ /name:.+/
        status[i]=1
        aff[i]=/name:(.+)/.match(form_str[i]).captures[0]
      elsif form_str[i] =~ /document:.+/
        status[i]=2
        aff[i]=/document:(.+)/.match(form_str[i]).captures[0]
      elsif form_str[i] =~ /option:.+/
        status[i]=3
        aff[i]=/option:(.+)/.match(form_str[i]).captures[0]
      elsif form_str[i] =~ /notice:.+/
        status[i]=4
        aff[i]=/notice:(.+)/.match(form_str[i]).captures[0]
      else
        return "Format wrong. Please search the document. #1"
      end
    end
    if step_s[0]!=0
      return "Format wrong. Please search the document. #2"
    end
    step_s.append form_str.length
    for i in 1..form_str.length-1
      if status[i]==3 and status[i+1]!=4
        return "Format wrong. Please search the document. #3"
      end
      if status[i]!=3 and status[i+1]==4
        return "Format wrong. Please search the document. #4"
      end
    end
    for i in 0..step_n-1
      nameline=0
      docline=0
      if aff[step_s[i]]!=i.to_s
        return "Format wrong. Please search the document. #5"+" "+i.to_s+" "+step_s[i].to_s
      end
      for ii in step_s[i]..step_s[i+1]-1
        if status[ii]==1
          nameline=nameline+1
        end
        if status[ii]==2
          docline=docline+1
        end
      end
      if nameline!=1 or docline!=1
        return "Format wrong. Please search the document. #6"
      end
    end
    qsid=Array.new(step_n)
    for i in 0..step_n-1
      qs=Qstep.new
      for ii in step_s[i]..step_s[i+1]-1
        if status[ii]==1
          qs.name=aff[ii]
        end
        if status[ii]==2
          qs.document=aff[ii]
        end
      end
      if i==step_n-1
        qs.kind=0
      else
        qs.kind=1
      end
      qs.save
      qsid[i]=qs.id
    end
    count=-1
    for i in 0..form_str.length-1
      if status[i]==0
        count=count+1
      end
      if status[i]==3
        op=Option.new
        op.qstep_id=qsid[count]
        op.qstep2_id=qsid[aff[i].to_i]
        op.noticestr=aff[i+1]
        op.save
      end
    end
    qf=Qformat.new
    qf.startstep_id=qsid[0]
    for i in 0..step_n-1
      qf.qsteps<<Qstep.find(qsid[i])
    end
    qf.save
    return qf.id
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
    qfid=form_format(params[:project][:format_text])
    if qfid.is_a? String
      flash[:notice] = qfid
      redirect_to root_path
      return nil
    end

    @project = Project.new
    @project.name=params[:project][:name]
    @project.entry_time=params[:project][:entry_time]
    @project.qformat_id=qfid

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