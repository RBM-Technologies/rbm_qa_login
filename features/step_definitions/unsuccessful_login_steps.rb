When(/^I enter my valid username$/) do
  fill_in('user_login', with: @current_user.username)
end

When(/^I enter an invalid password$/) do
  fill_in('user_password', with: 'invalid_password')
end

Then(/^I should remain on the login page$/) do
  expect(current_path).to match %r(/login$)
end

Then(/^I should see an error message$/) do
  expect(page).to have_content('Sorry, that username and password combination is not correct.')
end
