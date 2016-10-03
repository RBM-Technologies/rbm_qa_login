Given(/^I am a store manager with multiple locations$/) do
  create_user_with_single_location(
    'test_store_manager_multiple_loc',
    'test_store_manager_multiple_loc',
    'Store Manager',
    '235',
    'North Central',
    'TPR Chicago Southeast'
  )
  assign_location(
    @username,
    @password,
    '225',
    'North Central',
    'TPR Chicago Southeast'
  )
end

Then(/^I will see a list of my locations$/) do
  expect(page).to have_content(@location)
  expect(page).to have_content(@location2)
  expect(current_path).to match /\/locations$/
  click_link("Logoff #{@username}")
  destroy_user(@username)
end
