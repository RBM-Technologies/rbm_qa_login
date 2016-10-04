Given(/^I am a store manager with a single location$/) do
  create_user_with_single_location(
    'test_store_manager_single_loc',
    'test_store_manager_single_loc',
    'Store Manager',
    '147437',
    'Southeast',
    'Gulf States',
    'FL-Fort Walton Beach'
  )
end

Then(/^I will go to the page for my single location$/) do
  expect(page).to have_content(@location)
  expect(current_path).to match /\/locations/
  click_link("Logoff #{@username}")
  destroy_user(@username)
end
