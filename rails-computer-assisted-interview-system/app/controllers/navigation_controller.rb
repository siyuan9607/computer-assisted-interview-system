class NavigationController < ApplicationController
  def index
     if user_signed_in?
         @projects= Project.all
        @users= User.where(:role => 'interviewer')
          
     else
           redirect_to new_user_session_path
     end
  end

end
