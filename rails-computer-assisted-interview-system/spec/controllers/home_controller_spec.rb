# Created by Tao Ni
# Reference: https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)

require 'rails_helper'

# login
describe HomeController do
    describe "Admin not logged in" do
        it "should redirect to login page" do
            get :index
            response.should redirect_to(new_user_session_path)
        end
    end
    describe "Admin logged in\n" do
        before :each do
            @admin = User.create!({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password',:role => "admin" })
            sign_in @admin
        end
        it "should be successful and render the home page" do
            get :index
            response.should be_success
            response.should render_template(root_path)
        end
    end
end