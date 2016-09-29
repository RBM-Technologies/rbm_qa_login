Feature: Attempt to Visit URL without Logging In

Scenario:
  Given I have the credentials of RBM admin
  And I am on the login page
  And I am not logged in
  When I try to visit a page on the website
  Then I should remain on the login page
  And I should receive a request to login
  When I enter my credentials
  And I submit the form
  Then I should be redirected to the previously requested page
