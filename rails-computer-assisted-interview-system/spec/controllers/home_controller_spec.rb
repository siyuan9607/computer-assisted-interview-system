require 'rails_helper'

describe HomeController do
    describe "User not logged in" do
        it "should redirect to login page" do
            get :index
            expect(response).to redirect_to(new_user_session_path)
        end
    end
end