When(/^I logoff$/) do
  visit('/setup/logout')
end

Then(/^I will be taken to the login page$/) do
  expect(page).to have_content('Login')
end
