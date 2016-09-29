Feature: Unsuccessful Login as Local User - Invalid Username

Scenario:
  Given I am on the login page
  When I enter an invalid username
  And I submit the form
  Then I should remain on the login page
  And I should see an error message
