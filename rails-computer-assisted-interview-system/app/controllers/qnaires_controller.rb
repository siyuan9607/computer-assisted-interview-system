class QnairesController < ApplicationController
  def select_params
    params.require(:select).permit(:option, :answer)
  end

  def create
    #test
    Qnaire.delete_all
    Qstate.delete_all
    qf=Qformat.first
    qn=Qnaire.new
    qn.qformat=Qformat.find(qf.id)
    qn.current_id=qf.startstep_id
    qn.status=200
    qn.save
    @qn=qn
    @qf=qf
    redirect_to qnaires_path
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
    @qn=Qnaire.all
  end
end
