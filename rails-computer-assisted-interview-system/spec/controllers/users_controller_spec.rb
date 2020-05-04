# Created by Tao Ni
# Reference: https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)

require 'rails_helper'

# users
describe UsersController do
    describe "Admin not logged in" do
        it "should redirect to login page" do
            get :new
            response.should redirect_to(new_user_session_path)
        end
    end
    describe "Admin logged in\n" do
        before :each do
            @admin = User.create!({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password',:role => "admin" })
            @interviewer = User.create!({ :name => 'i1', :email => 'i1@example.com', :password => 'password', :password_confirmation => 'password',:role => "interviewer" })
            @project = Project.create!({ :name => 'test_project'})
            sign_in @admin
        end
        it "should redirect to new user page" do
            get :new
            response.should render_template(:new)
        end
        it "can edit user information" do
            params = {:id => 2}
            get :edit, params
            response.should render_template(:edit)
        end
        it "can assign or disassign project to users" do
            params = {:user_name => "i1", :user_email => "i1@example.com", :project_name => "test_project"}
            get :assign, params
            response.should_not render_template(:assign)
            get :disassign, params
            response.should_not render_template(:disassign)
        end
    end
end