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
  And I press "create_account"
  Then I should be on the home page
  And I should see "supervisor1 has been added to the system"
  
Scenario: login with the created supervisor account
  When I am on the login page
  