# Created by Tao Ni
# Reference: https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)

require 'rails_helper'

# login
describe QnairesController do
    describe "Interviewer not logged in" do
        it "should redirect to the login page" do
            get :index
            response.should redirect_to(new_user_session_path)
            get :show
            response.should redirect_to(new_user_session_path)
        end
    end
    describe "Interviewer logged in" do
        before :each do
            @interviewer = User.create!({ :name => 'i1', :email => 'i1@example.com', :password => 'password', :password_confirmation => 'password',:role => "interviewer" })
            sign_in @interviewer
        end
        it "should show the qnaires page" do
            pending "Add a qnaire here for test"
            get :show
            #response.should redirect_to(new_user_session_path)
        end
    end
end