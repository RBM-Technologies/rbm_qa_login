Feature: Successful Login by a Client Admin

Scenario:
  Given I have the credentials of Administrator
  And I am on the login page
  When I enter my credentials
  And I submit the form
  Then the admin dashboard should appear
