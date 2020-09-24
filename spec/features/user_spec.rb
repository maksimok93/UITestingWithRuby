require 'capybara/rspec'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS test', type: :feature do

  describe 'When on Users Page' do
    before(:each) do
      @users_page = Pages::Users.new
      @users_page.open_main_page
      @users_page.visit_users_page
    end

    it 'Verifies user can be created' do
      @users_page.add_new_user('John', 'test@example.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
      expect(page).to have_content("New user created.")
    end

    it 'Verifies possibility of editing existing user' do
      @users_page.choose_user('John')
      @users_page.edit_user('Author', 'Mark', 'Mich')
      expect(page).to have_content("User updated.")
    end

    it 'Verifies user can be deleted' do
      @users_page.delete_user('John')
      expect(page).to have_content("User deleted.")
    end
  end
end
