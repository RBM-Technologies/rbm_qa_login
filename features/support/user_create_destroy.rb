module UserHelpers
  def create_user_with_expired_password(role)
    @rbm_admin = credentials_for('RBM admin')
    login_as(@rbm_admin)
    visit('/setup/security/users/new')
    fill_in('user_login', with: 'expired_password_test_username')
    fill_in('user_password', with: 'expired_password_test_password')
    fill_in('user_password_confirmation', with: 'expired_password_test_password')
    find(:css, "#user_role_ids_[value='#{value_for(role)}']").set(true)
    click_link('Set to current date/time')
    click_on('Create')
    click_on("Logoff #{@rbm_admin.username}")
    page.driver.browser.accept_js_confirms
    User.new('expired_password_test_username', 'expired_password_test_password', role, '678')
  end

  def create_user_with_single_location(username, password, role, location, *districts)
    @rbm_admin = credentials_for('RBM admin')
    login_as(@rbm_admin)
    visit('/setup/security/users/new')
    fill_in('user_login', with: username)
    fill_in('user_password', with: password)
    fill_in('user_password_confirmation', with: password)
    find(:css, "#user_role_ids_[value='#{value_for(role)}']").set(true)
    districts.each do |district|
      sleep 5
      find("#regions > fieldset li span", text: "#{district}").click
    end
    sleep 2
    find(:css, "#user_location_ids_[value='#{value_for_location(location)}']").set(true)
    click_on('Create')
    click_on("Logoff #{@rbm_admin.username}")
    page.driver.browser.accept_js_confirms
    User.new(username, password, role, location)
  end

  def assign_location(username, password, location, *districts)
    @rbm_admin = credentials_for('RBM admin')
    login_as(@rbm_admin)
    visit('/setup/security/users/list')
    fill_in('query', with: username)
    click_on('Search')
    click_on('Edit')
    districts.each do |district|
      sleep 3
      find("#regions > fieldset li span", text: "#{district}").click
    end
    sleep 2
    find(:css, "#user_location_ids_[value='#{value_for_location(location)}']").set(true)
    click_on('Save')
    click_on("Logoff #{@rbm_admin.username}")
    page.driver.browser.accept_js_confirms
    @location2 = location
  end

  def destroy_user(user)
    @rbm_admin = credentials_for('RBM admin')
    login_as(@rbm_admin)
    visit('/setup/security/users/list')
    fill_in('query', with: user.username)
    click_on('Search')
    click_on('Delete')
  end
end

World UserHelpers
