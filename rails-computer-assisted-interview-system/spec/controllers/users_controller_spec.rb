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
            user = User.create!({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password',:role => "admin" })
            sign_in user
        end
        it "should redirect to home page" do
            get :new
            response.should render_template(:new)
        end
    end
end