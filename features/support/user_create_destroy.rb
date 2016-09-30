module UserHelpers
  def create_user_with_expired_password(role)
    login_as('RBM admin')
    visit('/setup')
    click_on('Security')
    click_on('Users')
    click_on('New User')
    fill_in('user_login', with: 'expired_password_test_username')
    fill_in('user_password', with: 'expired_password_test_password')
    fill_in('user_password_confirmation', with: 'expired_password_test_password')
    find(:css, "#user_role_ids_[value='#{value_for(role)}']").set(true)
    click_link('Set to current date/time')
    click_on('Create')
    click_on("Logoff #{@username}")
    page.driver.browser.accept_js_confirms
    @username = 'expired_password_test_username'
    @password = 'expired_password_test_password'
  end

  def create_user_with_single_location(username, password, role, location, *districts)
    login_as('RBM admin')
    visit('/setup')
    click_on('Security')
    click_on('Users')
    click_on('New User')
    fill_in('user_login', with: username)
    fill_in('user_password', with: password)
    fill_in('user_password_confirmation', with: password)
    find(:css, "#user_role_ids_[value='#{value_for(role)}']").set(true)
    districts.each do |district|
      find(:xpath, "//*[text()[contains(., '#{district}')]]").click
    end
    find(:css, "#user_location_ids_[value='#{value_for_location(location)}']").set(true)
    click_on('Create')
    click_on("Logoff #{@username}")
    page.driver.browser.accept_js_confirms
    @username = username
    @password = password
    @location = location
  end

  def assign_location(username, password, location, *districts)
    login_as('RBM admin')
    visit('/setup')
    click_on('Security')
    click_on('Users')
    fill_in('query', with: username)
    click_on('Search')
    click_on('Edit')
    districts.each do |district|
      find(:xpath, "//*[text()[contains(., '#{district}')]]").click
    end
    find(:css, "#user_location_ids_[value='#{value_for_location(location)}']").set(true)
    click_on('Save')
    click_on("Logoff #{@username}")
    page.driver.browser.accept_js_confirms
    @username = username
    @password = password
    @location2 = location
  end

  def destroy_user(username)
    login_as('RBM admin')
    visit('/setup')
    click_on('Security')
    click_on('Users')
    fill_in('query', with: username)
    click_on('Search')
    click_on('Delete')
  end
end

World UserHelpers
