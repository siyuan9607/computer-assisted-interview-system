# created by Tao Ni

def get_admin
    @admin ||= User.where(:role => "admin").first
    @default_password = "password"
end

# Given
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

# When, And
When /I go to the (.*) page/ do |page_name|
    path_mapping = {
        'home' => root_path,
    }
    visit path_mapping[page_name]
end

When /I am logged in to the home page/ do 
    visit root_path
    get_admin
    fill_in "user_email", :with => @admin[:email]
    fill_in "user_password", :with => (@admin[:password] || @default_password)
    click_button "user_login"
end

And /I fill in "(.*)" with "(.*)"/ do |field, value|
    fill_in(field, :with => value)
end

And /I press "(.*)"/ do |button|
    click_button(button)
end

And /I click "(.*)"/ do |link|
    click_link(link)
end

And /I should see "(.*)"/ do |content|
    page.should have_content(content)
end

And /I should see "(.*)"/ do |content|
    page.should have_content(content)
end

# Then
Then /I should be on the (.*) page/ do |page_name|
    path_mapping = {
        'login' => new_user_session_path,
        'home' => root_path,
        'sign up' => create_account_path
    }
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_mapping[page_name]
    else
        assert_equal path_mapping[page_name], current_path
    end
end
