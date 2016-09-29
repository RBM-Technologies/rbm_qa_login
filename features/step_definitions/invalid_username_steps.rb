When(/^I enter an invalid username$/) do
  fill_in('user_login', with: 'invalid_username')
end
