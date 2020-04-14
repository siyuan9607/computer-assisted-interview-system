Feature: login to the computer assisted interview system
 
  As an administrator
  So that I can track the interviewers
  I want to login to the system

Background: there is an administrator account

  Given the following users exist:
  | email             | password  | role   |
  | admin@example.com | password  | admin  |

  And  I am on the login page

Scenario: login to the system
  When I check the following ratings: PG, R
  And I uncheck the following ratings: G, PG-13
  And I press "ratings_submit"
  Then I should see "The Incredibles"
  And I should see "The Terminator"
  And I should not see "Alladin"
  And I should not see "The Help"