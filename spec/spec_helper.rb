require 'capybara'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'webdrivers/chromedriver'
require_relative '../pages/base_page'
require_relative '../pages/dashboard_page'
require_relative '../pages/posts_page'
require_relative '../pages/users_page'
require_relative '../pages/export_page'
require_relative '../locators'
require_relative '../links'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = Links::ENTRY_PAGE

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
