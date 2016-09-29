Feature: Successful Login as Admin

Scenario:
  Given I have the credentials of RBM admin
  And I am on the login page
  When I enter my credentials
  And I submit the form
  Then the admin dashboard should appear
