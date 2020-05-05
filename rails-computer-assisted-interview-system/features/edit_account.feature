# created by Tao Ni

Feature: create a new account
 
  As an administrator
  So that I can hire more supervisors and interviewers
  I want to add a new account

Background: there is an administrator account

  Given the following users exist:
  | name    | email               | password  | password_confirmation   | role        |
  | admin   | admin@example.com   | password  | password                | admin       |
  | i1      | i1@example.com      | password  | password                | interviewer |

Scenario: edit an interviewer account
  When I am logged in to the home page
  Then I should be on the home page
  And I should see "i1"
  And I press "detail_i1"
  Then I should be on the user detail page for "i1"
  And I press "update_user"
  Then I should be on the user update page for "i1"
  