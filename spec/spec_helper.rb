# frozen_string_literal: true

require 'capybara'
require 'selenium/webdriver'
require 'capybara/rspec'
require_relative '../pages/base_page'
require_relative '../pages/dashboard_page'
require_relative '../pages/posts_page'
require_relative '../pages/users_page'
require_relative '../pages/export_page'
require_relative '../locators'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = Links::ENTRY_PAGE
