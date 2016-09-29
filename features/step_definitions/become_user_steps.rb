Given(/^I am logged in as an RBM Admin$/) do
  login_as('RBM admin')
end

When(/^I search the list of users for a specific username$/) do
  role_credentials('Store Manager')
  visit('/setup')
  click_on('Security')
  click_on('Users')
  fill_in('query', with: @username)
  click_on('Search')
  expect(page).to have_content(@username)
end

When(/^I become that user$/) do
  click_link('Become this user', match: :first)
end

Then(/^I am redirected to that user's home page$/) do
  expect(current_path).to match /\/locations$/
end

Then(/^I should see their username on the page$/) do
  expect(page).to have_content("Logoff #{@username}")
end

Then(/^I should be able to switch back to myself as user$/) do
  role_credentials('RBM admin')
  expect(page).to have_content("Switch back to #{@username}")
end

When(/^I switch back to myself as user$/) do
  click_link("Switch back to #{@username}")
end

Then(/^I should be redirected back to my home page$/) do
  expect(page).to have_content("Logoff #{@username}")
  expect(current_path).to match /\/admin$/
end
