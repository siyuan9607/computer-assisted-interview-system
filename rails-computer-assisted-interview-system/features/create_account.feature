# created by Tao Ni

Feature: create a new account
 
  As an administrator
  So that I can hire more supervisors and interviewers
  I want to add a new account

Background: there is an administrator account

  Given the following users exist:
  | email             | password  | password_confirmation   | role    |
  | admin@example.com | password  | password                | admin   |

Scenario: create a supervisor account
  When I am logged in to the home page
  Then I should be on the home page
  And I click "Create Account"
  Then I should be on the sign up page
  And I fill in "user_name" with "supervisor1"
  And I fill in "user_email" with "supervisor1@example.com"
  And I fill in "user_password" with "password"
  And I fill in "user_password_confirmation" with "password"
  And I select "user_role" as "supervisor"
  And I press "create_account"
  Then I should be on the home page
  And I should see "supervisor1 has been added to the system"
  And I click "Sign out"
  Then I should be on the login page
  And I fill in "user_email" with "supervisor1@example.com"
  And I fill in "user_password" with "password"
  And I press "user_login"
  Then I should be on the home page
  And I should not see "Create Account"
  
Scenario: create an interviewer account
  When I am logged in to the home page
  Then I should be on the home page
  And I click "Create Account"
  Then I should be on the sign up page
  And I fill in "user_name" with "interviewer1"
  And I fill in "user_email" with "interviewer1@example.com"
  And I fill in "user_password" with "password"
  And I fill in "user_password_confirmation" with "password"
  And I select "user_role" as "interviewer"
  And I press "create_account"
  Then I should be on the home page
  And I should see "interviewer1 has been added to the system"
  And I click "Sign out"
  Then I should be on the login page
  And I fill in "user_email" with "interviewer1@example.com"
  And I fill in "user_password" with "password"
  And I press "user_login"
  Then I should be on the qnaires page
  And I should not see "Create Account"
  And I should not see "Create Project"
  And I should not see "Navigation"
  And I should see "projects assigned to you are listed below"
  