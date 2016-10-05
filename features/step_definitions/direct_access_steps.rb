Given(/^I am not logged in$/) do
  expect(page).to have_content('Login')
  expect(page).to_not have_content("Logoff #{@current_user.username}")
end

When(/^I try to visit a page on the website$/) do
  visit('/admin/contents/list')
end

Then(/^I should receive a request to login$/) do
  expect(page).to have_content('Please login')
end

Then(/^I should be redirected to the previously requested page$/) do
  expect(current_path).to eq('/admin/contents/list')
end
