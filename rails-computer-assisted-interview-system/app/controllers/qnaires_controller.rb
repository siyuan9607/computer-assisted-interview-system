class QnairesController < ApplicationController
  def select_params
    params.require(:select).permit(:option, :answer)
  end

  def index
    #test
    Qformat.delete_all
    Qnaire.delete_all
    Qstep.delete_all
    Qstate.delete_all
    qf=Qformat.new
    qf.save
    qs=Qstep.new
    qs.name = "Do you support President Trump?"
    qs.document = "Ask if the interviewee supports President Trump. "
    qs.kind=1
    qs.save
    qs2=Qstep.new
    qs2.name = "Yes I support President Trump"
    qs2.document = "Ask if the interviewee extremely supports President Trump"
    qs2.kind = 1
    qs2.save
    qs3=Qstep.new
    qs3.name = "Yes I extremely support President Trump"
    qs3.document = "Ask if the interviewee extremely supports President Trump"
    qs3.kind = 1
    qs3.save
    qs4=Qstep.new
    qs4.name = "Long live President Trump his excellency"
    qs4.document = "To end the questionnaire normally"
    qs4.kind = 0
    qs4.save
    qs.options<<qs2
    qs.options<<qs3
    qs.options<<qs4
    qs2.options<<qs3
    qs2.options<<qs4
    qs3.options<<qs4
    qs.save
    qs2.save
    qs3.save
    qs4.save
    qf=Qformat.first
    qf.qsteps<<qs
    qf.qsteps<<qs2
    qf.qsteps<<qs3
    qf.qsteps<<qs4
    qf.startstep_id=qs.id
    qf.save
    qn=Qnaire.new
    qn.qformat=Qformat.find(qf.id)
    qn.current_id=qf.startstep_id
    qn.status=200
    qn.save
    @qn=qn
    @qf=qf
  end

  def show
    id = params[:id]
    @qn=Qnaire.find(id)
    @current=Qstep.find(@qn.current_id)
    if @current.nil?
      @current="nil"
    end
    @options=Qstep.find(@current).options
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
end
