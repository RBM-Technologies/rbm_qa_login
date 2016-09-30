Feature:  Successful Login by a Store Manager with Multiple Locations

@javascript
Scenario:
  Given I am a store manager with multiple locations
  And I am on the login page
  When I enter my credentials
  And I submit the form
  Then I will see a list of my locations
