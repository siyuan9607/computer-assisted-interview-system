class QnairesController < ApplicationController
  def select_params
    params.require(:select).permit(:option, :answer)
  end

  def create
    #test
    # Qnaire.delete_all
    # Qstate.delete_all
    # qf=Qformat.first
    # qn=Qnaire.new
    # qn.qformat=Qformat.find(qf.id)
    # qn.current_id=qf.startstep_id
    # qn.status=200
    # qn.save
    # @qn=qn
    # @qf=qf
    proj=User.find(current_user.id).project
    if proj.nil?
      flash[:notice]="You are assigned to no project. "
      redirect_to qnaires_path
      return
    end
    qn=Qnaire.new
    proj=Project.find(User.find(current_user.id).project)
    qf=Qformat.find(proj.qformat_id)
    qn.qformat=qf
    qn.current_id=qf.startstep_id
    qn.status=200
    qn.save
    redirect_to qnaire_path(qn.id)
  end

  def show
    id = params[:id]
    @qn=Qnaire.find(id)
    @current=Qstep.find(@qn.current_id)
    if @current.nil?
      @current="nil"
    end
    options=Option.where(:qstep_id => @qn.current_id)
    @options=Array.new
    for opt in options do
      iopt={}
      iopt["id"]=opt.qstep2_id
      iopt["notice"]=opt.noticestr
      @options<<iopt
    end
    questions=Question.where(:step_id => @qn.current_id)
    @questions=Array.new
    for ques in questions do
      ques_item={}
      ques_item["id"]=ques.id
      ques_item["content"]=ques.content
      ques_item["answers"]=Array.new
      for ans in ques.qanswers
        ians={}
        ians["id"]=ans.id
        ians["content"]=ans.content
        ques_item["answers"]<<ians
      end
      @questions<<ques_item
    end
  end

  def update
    @qn=Qnaire.find(params[:id])
    current=Qstep.find(@qn.current_id)
    opt=params[:select][:option]
    if current.kind!=0
      if (opt==nil)
        redirect_to qnaire_path(params[:id])
        return
      end
      questions=Question.where(:step_id => @qn.current_id)
      @questions=Array.new
      for ques in questions do
        ans_id=params[:select][("answer_"+ques.id.to_s).to_sym]
        unless ans_id.nil?
          ans=Qanswer.find(ans_id)
          ans.count=ans.count+1
          ans.save
        else
          abort
        end
      end
      @opt=Qstep.find(opt)
      qst=Qstate.new
      qst.qnaire=@qn
      qst.qstep=current
      qst.answer=params[:select][:answer]
      qst.save
      @qn.current_id=@opt.id
      @qn.save
    else
      qst=Qstate.new
      qst.qnaire=@qn
      qst.qstep=current
      qst.answer=params[:select][:answer]
      qst.save
      @qn.status=500
      @qn.save
    end
    redirect_to qnaire_path(params[:id])
  end



  def index
    @callback_qnaires=Qnaire.where(:status => 300, :user_id => current_user.id)
  end
end
