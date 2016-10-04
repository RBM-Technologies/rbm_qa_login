begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-webkit'
require 'csv'
require 'launchy'
require 'pry'

Capybara.configure do |config|
  config.app_host = 'https://att-vmm-qa.aws.rbmtechnologies.com'
end

Capybara::Webkit.configure do |config|
  config.allow_url("tmobile-vmm-qa.aws.rbmtechnologies.com")
  config.allow_url("att-vmm-qa.aws.rbmtechnologies.com")
  config.allow_url("www.google-analytics.com")
  config.allow_url("https://tracker.totango.com/totango3.js")
end

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
Capybara.run_server = false
Capybara.ignore_hidden_elements = false
