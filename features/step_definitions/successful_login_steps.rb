Given(/^I have the credentials of (.+)$/) do |role|
  role_credentials(role)
end

Given(/^I am on the login page$/) do
  visit('/view/login')
end

When(/^I enter my credentials$/) do
  fill_in('user_login', with: @username)
  fill_in('user_password', with: @password)
end

When(/^I submit the form$/) do
  click_on('Login')
end

Then(/^the admin dashboard should appear$/) do
  expect(page).to have_content('Login successful')
  expect(page).to have_content("Logoff #{@username}")
end
