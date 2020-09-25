require_relative '../spec_helper'

feature 'OpenSourceCMS test', type: :feature do

  describe 'When on Users Page' do
    before(:each) do
      @users_page = Users.new
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

  describe 'Negative user stories when on Users Page' do
    before(:each) do
      @users_page = Users.new
      @users_page.open_main_page
      @users_page.visit_users_page
    end
    it "Verifies user can't be created if username is already exists" do
      @users_page.add_new_user('Michael', 'test@test.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
      expect(page).to have_content("This username is already registered. Please choose another one.")
    end

    it "Verifies user can't be created if e-mail is already exists" do
      @users_page.add_new_user('Nick', 'test@ex.com', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
      expect(page).to have_content("This email is already registered, please choose another one.")
    end

    it "Verifies user can't be created if e-mail isn't correct" do
      @users_page.add_new_user('Nick', 'test', 'John', 'Smith', 'google.com', 'Password<>12348989898989')
      expect(page).to have_content("The email address isn’t correct.")
    end
  end
end
