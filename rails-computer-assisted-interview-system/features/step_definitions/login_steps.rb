# created by Tao Ni

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

When /I go to the (.*) page/ do |page_name|
    path_mapping = {
        'home' => root_path,
    }
    visit path_mapping[page_name]
end

Then /I should be on the (.*) page/ do |page_name|
    path_mapping = {
        'login' => new_user_session_path,
        'home' => root_path,
    }
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_mapping[page_name]
    else
        assert_equal path_mapping[page_name], current_path
    end
end

And /I fill in "(.*)" with "(.*)"/ do |field, value|
    fill_in(field, :with => value)
end

And /I press "(.*)"/ do |button|
    click_button(button)
end