Given(/^I am logged in as an RBM admin$/) do
  login_as ('RBM admin')
  expect(page).to have_content("Logoff #{@username}")
end

When(/^I logoff$/) do
  visit('/setup/logout')
end

Then(/^I will be taken to the login page$/) do
  expect(page).to have_content('Login')
end
