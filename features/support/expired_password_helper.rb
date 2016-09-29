module ExpiredPasswordHelpers
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
end

World ExpiredPasswordHelpers
