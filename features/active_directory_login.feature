Feature: Successful Login as Admin

Scenario:
  Given I have the credentials of RBM Admin
  And I have entered the login section
  When I enter my credentials
  And I submit the form
  Then the admin dashboard should appear
