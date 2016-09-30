Feature: Successful Login of a Store Manager with a Single Location

@javascript
Scenario:
  Given I am a store manager with a single location
  And I am on the login page
  When I enter my credentials
  And I submit the form
  Then I will go to the page for my single location
