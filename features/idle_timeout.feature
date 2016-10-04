Feature: Idle Timeout

Scenario:
  Given I am logged in as an RBM admin
  When I remain idle for longer than the timeout time
  And I try to navigate to another page on the website
  Then  I am redirected to the login page
  When I try to visit a page on the website
  Then I should remain on the login page
  And I should receive a request to login 
