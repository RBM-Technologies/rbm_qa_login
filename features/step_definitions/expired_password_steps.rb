Given(/^I am a user of role (.+) with an expired password$/) do |role|
  @current_user = create_user_with_expired_password(role)
end

When(/^I enter an expired password$/) do
  fill_in('user_password', with: @current_user.password)
end

Then(/^Login should not succeed$/) do
  expect(page).to have_content('Your password has expired. Please reset it below')
end

Then(/^I should be taken to an update password page$/) do
  expect(current_path).to match /\/require_password_reset/
end

When(/^I enter a new password$/) do
  sleep 5
  click_on('Acknowledge')
  fill_in('password', with: 'updated_test_password')
  fill_in('password_confirmation', with: 'updated_test_password')
end

When(/^I submit the reset password form$/) do
  click_on('Reset Password')
end

Then(/^login should succeed$/) do
  expect(page.text).to have_content(/Markets/)
end

Then(/^I should be redirected to my home page$/) do
  expect(current_path).to match /\/locations/
  click_link("Logoff #{@current_user.username}")
  destroy_user(@current_user)
end
