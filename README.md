# computer-assisted-interview-system
the implemenation of a computer assisted interview system integrated with VOIP and survey generator
    helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    User.find_by(id: session[:id])
  end
  
  def logged_in?
    !current_user.nil?
  end 