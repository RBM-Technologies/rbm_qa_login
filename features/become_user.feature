Feature:  Become a Different User from the User List View

Scenario:
  Given I am logged in as an RBM admin
  When I search the list of users for a specific username
  And I become that user
  Then I am redirected to that user's home page
  And I should see their username on the page
  And I should be able to switch back to myself as user
  When I switch back to myself as user
  Then I should be redirected back to my home page
