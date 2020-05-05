
Feature: login to the computer assisted interview system
 
  As an administrator
  So that I can manage my interviewers
  I want to login to the system

Background: there is an administrator account

  Given the following users exist:
  | name    | email               | password  | password_confirmation   | role        |
  | admin   | admin@example.com   | password  | password                | admin       |

Scenario: login to the system
  When I go to the home page
  Then I should be on the login page
  And I fill in "user_email" with "admin@example.com"
  And I fill in "user_password" with "password"
  And I press "user_login"
  And I should be on the home page
  And I should see "Welcome to the Computer-assisted-interview system"
  And I should see "List of Projects"
  And I should see "List of Registered Interviewer"