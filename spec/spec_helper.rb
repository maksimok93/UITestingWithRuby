require 'capybara'
require 'selenium/webdriver'
require_relative '../pages'
require_relative '../locators'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = Links::ENTRY_PAGE
