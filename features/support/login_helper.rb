@username = ''
@password = ''

module LoginHelpers
  def login_as (user)
    visit('/view/login')
    fill_in('user_login', with: user.username)
    fill_in('user_password', with: user.password)
    click_on('Login')
  end

  def logoff
    visit('/setup/logout')
  end
end

World LoginHelpers
