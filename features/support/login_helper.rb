@username = ''
@password = ''

module LoginHelpers
  def login_as (role)
    role_credentials(role)
    visit('/view/login')
    fill_in('user_login', with: @username)
    fill_in('user_password', with: @password)
    click_on('Login')
  end

  def logoff
    visit('/setup/logout')
  end
end

World LoginHelpers
