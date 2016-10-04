Feature: Session Timeout

Scenario:
  Given I am logged in as an RBM admin
  When I have been active on the site longer than the timeout time
  Then  I am redirected to the login page
  When I try to visit a page on the website
  Then I should remain on the login page
  And I should receive a request to login
  And I can login and reset the session timeout setting
