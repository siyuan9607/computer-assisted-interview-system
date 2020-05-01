class Qformat < ActiveRecord::Base
  has_many :qnaires
  has_many :qsteps

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
        return "Format wrong. Please search the document. "
      end
    end
    if step_s[0]!=0
      return "Format wrong. Please search the document. "
    end
    step_s.append form_str.length
    for i in 1..form_str.length-1
      if status[i]==3 and status[i+1]!=4
        return "Format wrong. Please search the document. "
      end
      if status[i]!=3 and status[i+1]==4
        return "Format wrong. Please search the document. "
      end
    end
    for i in 0..step_n
      nameline=0
      docline=0
      if aff[step_s[i]]!=i.to_s
        return "Format wrong. Please search the document. "
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
        return "Format wrong. Please search the document. "
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
    return qf.id
  end
end
