module TimeoutHelpers
  def set_idle_timeout(seconds)
    visit('/setup/admin/settings')
    # if find(:xpath, "//*h3[text()='idle_timeout_interval_seconds']/following-sibling::*[1]/self::a")
    #   find(:xpath, "//*h3[text()='idle_timeout_interval_seconds')]/following-sibling::*[1]/self::a").click
    # end
    # page.find(:xpath, '//h3[contains(., "idle_timeout_interval_seconds")]/following-sibling::a[1]')
    # if page.find('h3', text: 'idle_timeout_interval_seconds').find(:css, 'a', text: 'Create Setting')
    #   page.find('h3', text: 'idle_timeout_interval_seconds').find(:css, 'a').click
    # end
    find('h3', text: 'idle_timeout_interval_seconds').find('#value').set(seconds)
    find('h3', text: 'idle_timeout_interval_seconds').find("input[value='Save']").click
  end

  def reset_idle_timeout(seconds)
    visit('/setup/admin/settings')
    find('h3', text: 'idle_timeout_interval_seconds').find('#value').set(seconds)
    find('h3', text: 'idle_timeout_interval_seconds').find("input[value='Save']").click
  end

  def set_session_timeout(seconds)
    visit('/setup/admin/settings')
    el = page.find('#session_timeout_interval_seconds').find('Create Setting')
    el.click unless el.nil?
    find('h3', text: 'session_timeout_interval_seconds').find('#value').set(seconds)
    find('h3', text: 'session_timeout_interval_seconds').find("input[value='Save']").click
  end

  def reset_session_timeout(seconds)
    visit('/setup/admin/settings')
    find('h3', text: 'session_timeout_interval_seconds').find('#value').set(seconds)
    find('h3', text: 'session_timeout_interval_seconds').find("input[value='Save']").click
  end
end

World TimeoutHelpers
