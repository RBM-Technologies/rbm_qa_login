Given(/^I am a store manager with multiple locations$/) do
  @current_user = create_user_with_single_location(
    'test_sm_mult_loc',
    'test_sm_mult_loc',
    'store_manager',
    '147437',
    'Southeast',
    'Gulf States',
    'FL-Fort Walton Beach'
  )
  assign_location(
    @current_user.username,
    @current_user.password,
    '147638',
    'Southeast',
    'Gulf States',
    'FL-Fort Walton Beach'
  )
end

Then(/^I will see a list of my locations$/) do
  visit('/locations')
  expect(page).to have_content(@current_user.location)
  expect(page).to have_content(@location2)
  expect(current_path).to match /\/locations$/
  visit('/admin/logout')
  destroy_user(@current_user)
end
