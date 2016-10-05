Given(/^I am logged in as an RBM admin$/) do
  @rbm_admin = credentials_for('RBM admin')
  login_as(@rbm_admin)
  expect(page).to have_content("Logoff #{@rbm_admin.username}")
end

When(/^I search the list of users for a specific username$/) do
  @store_manager = credentials_for('Store Manager')
  visit('/setup')
  click_on('Security')
  click_on('Users')
  fill_in('query', with: @store_manager.username)
  click_on('Search')
  expect(page).to have_content(@store_manager.username)
end

When(/^I become that user$/) do
  click_link('Become this user', match: :first)
end

Then(/^I am redirected to that user's home page$/) do
  expect(current_path).to match /\/locations$/
end

Then(/^I should see their username on the page$/) do
  expect(page).to have_content("Logoff #{@store_manager.username}")
end

Then(/^I should be able to switch back to myself as user$/) do
  expect(page).to have_content("Switch back to #{@rbm_admin.username}")
end

When(/^I switch back to myself as user$/) do
  click_link("Switch back to #{@rbm_admin.username}")
end

Then(/^I should be redirected back to my home page$/) do
  expect(page).to have_content("Logoff #{@rbm_admin.username}")
  expect(current_path).to match /\/admin$/
end
