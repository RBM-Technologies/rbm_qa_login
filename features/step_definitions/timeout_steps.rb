When(/^I remain idle for longer than the timeout time$/) do
  set_idle_timeout('15')
  sleep 16
end

When(/^I try to navigate to another page on the website$/) do
  visit('/setup/locations')
end

Then(/^I am redirected to the login page$/) do
  expect(page).to have_content('Login')
  expect(current_path). to match /\/login$/
end

Then(/^I can login and reset the idle timeout time$/) do
  login_as('RBM admin')
  reset_idle_timeout('2880')
  logoff
end

When(/^I have been active on the site longer than the timeout time$/) do
  set_session_timeout('15')
  sleep 16
end

Then(/^I can login and reset the session timeout setting$/) do
  login_as('RBM admin')
  reset_session_timeout('360000')
  logoff
end
