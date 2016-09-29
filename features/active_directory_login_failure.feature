Feature: Unsuccessful Login as RBM Admin - Invalid Password

Scenario:
  Given I have the credentials of RBM admin
  And I am on the login page
  When I enter my valid username
  And I enter an invalid password
  And I submit the form
  Then I should remain on the login page
  And I should see an error message
