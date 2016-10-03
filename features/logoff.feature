Feature:  Successful Logoff

Scenario:
  Given I am logged in as an RBM admin
  When I logoff
  Then I will be taken to the login page
  When I try to visit a page on the website
  Then I should remain on the login page
  And I should receive a request to login
