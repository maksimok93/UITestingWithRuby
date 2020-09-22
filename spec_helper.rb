require 'capybara'
require 'selenium/webdriver'
require './pages'
require './locators'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = Links::ENTRY_PAGE

session = Pages::Users.new
session.open_main_page
session.visit_users_page
session.choose_user("John")
# session.edit_user("Contributor", "Maks", "Smith")
# session.add_new_user('John', 'test@example.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
# session.add_new_user('Mark', 'test10@example.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
