require_relative '../spec_helper'

feature 'OpenSourceCMS test', type: :feature do

  describe 'When on New User Page' do
    before(:each) do
      @users_page = Users.new
      @users_page.open_main_page
      @users_page.visit_new_user_page

      @first_name = 'John'
      @last_name = 'Smith'
      @website = 'google.com'
      @password = 'Password<>12348989898989'
    end

    it 'Verifies user can be created' do
      @users_page.add_new_user('John', 'test@example.com', @first_name, @last_name, @website, @password)
      expect(page).to have_content('New user created.')
    end

    it "Verifies user can't be created if username already exists" do
      @users_page.add_new_user('Michael', 'test@test.com', @first_name, @last_name, @website, @password)
      expect(page).to have_content('This username is already registered. Please choose another one.')
    end

    it "Verifies user can't be created if e-mail already exists" do
      @users_page.add_new_user('Nick', 'test@ex.com', @first_name, @last_name, @website, @password)
      expect(page).to have_content('This email is already registered, please choose another one.')
    end

    it "Verifies user can't be created if e-mail isn't correct" do
      @users_page.add_new_user('Nick', 'test', @first_name, @last_name, @website, @password)
      expect(page).to have_content('The email address isn’t correct.')
    end

    it 'Verifies if Add New User button is enabled' do
      expect(page).to have_button('Add New User')
    end
  end

  describe 'When on User Page' do
    before(:each) do
      @users_page = Users.new
      @users_page.open_main_page
      @users_page.visit_users_page
    end

    it 'Verifies user can be edited' do
      @users_page.choose_user('John')
      @users_page.edit_user('Author', 'Mark', 'Mich')
      expect(page).to have_content('User updated.')
    end

    it 'Verifies user can be deleted' do
      @users_page.delete_user('John')
      expect(page).to have_content('User deleted.')
    end

    it 'Verifies users role can be edited' do
      @users_page.change_users_role('Kyle', 'Editor')
      expect(page).to have_content('Changed roles.')
    end

    it 'Verifies if Search Users button is enabled' do
      expect(page).to have_button('Search Users')
    end
  end
end
