class QformatsController < ApplicationController
  def index
    @qf=Qformat.all
  end

  def new

  end

  def create
    Qformat.delete_all
    Qstep.delete_all
    Qnaire.delete_all
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
    qs.save
    qs2.save
    qs3.save
    qs4.save
    op=Option.new
    op.qstep_id=qs.id
    op.qstep2_id=qs2.id
    op.noticestr="To QS2"
    op.save
    op=Option.new
    op.qstep_id=qs.id
    op.qstep2_id=qs3.id
    op.noticestr="To QS3"
    op.save
    op=Option.new
    op.qstep_id=qs.id
    op.qstep2_id=qs4.id
    op.noticestr="To QS4"
    op.save
    op=Option.new
    op.qstep_id=qs2.id
    op.qstep2_id=qs3.id
    op.noticestr="To QS3"
    op.save
    op=Option.new
    op.qstep_id=qs2.id
    op.qstep2_id=qs4.id
    op.noticestr="To QS4"
    op.save
    op=Option.new
    op.qstep_id=qs3.id
    op.qstep2_id=qs4.id
    op.noticestr="To QS4"
    op.save
    qf=Qformat.first
    qf.qsteps<<qs
    qf.qsteps<<qs2
    qf.qsteps<<qs3
    qf.qsteps<<qs4
    qf.startstep_id=qs.id
    qf.save
    redirect_to qformats_path
  end

  def show
    @qf=Qformat.find(params[:id])
  end

  def update
    qf=Qformat.find(params[:id])
    qn=Qnaire.new
    qn.qformat=Qformat.find(qf.id)
    qn.current_id=qf.startstep_id
    qn.status=200
    qn.save
    redirect_to qformats_path
  end



end
