# Created by Tao Ni
# Reference: https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)

require 'rails_helper'

# login
describe HomeController do
    describe "Admin logged in" do
        it "should redirect to home page" do
            user = User.create!({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password',:role => "admin" })
            sign_in user
            get :index
            expect(response).to render_template(:index)
        end
    end
    describe "Admin not logged in" do
        it "should redirect to login page" do
            get :index
            expect(response).to redirect_to(new_user_session_path)
        end
    end
end