Given(/^I am a store manager with a single location$/) do
  @current_user = create_user_with_single_location(
    'test_sm_single_loc1',
    'test',
    'store_manager',
    '147437',
    'Southeast',
    'Gulf States',
    'FL-Fort Walton Beach'
  )
end

Then(/^I will go to the page for my single location$/) do
  expect(page).to have_content(@current_user.location)
  expect(current_path).to match /\/locations/
  visit('/admin/logout')
  destroy_user(@current_user)
end
