require 'capybara/rspec'
require 'capybara'
require 'selenium-webdriver'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS test', type: :feature do

  describe Pages::Users do
    it "#add_new_user" do
      session = Pages::Users.new
      session.open_main_page
      session.visit_users_page
      session.add_new_user('John', 'test@example.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')

      expect(page).to have_content("New user created.")
    end
  end

  describe Pages::Users do
    it "#delete_user" do
      session = Pages::Users.new
      session.open_main_page
      session.visit_users_page
      session.delete_user('John')

      expect(page).to have_content("User deleted.")
    end
  end
end
