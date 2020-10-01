# frozen_string_literal: true

require_relative '../spec_helper'

feature 'OpenSourceCMS test', type: :feature do
  describe 'When on New User Page,' do
    let(:user) { eval(File.open('users_data', &:read)) }
    let(:messages) { eval(File.open('messages_data', &:read)) }

    describe 'when all test data is valid' do
      before(:each) do
        @users_page = Users.new
        @users_page.open_main_page
        @users_page.visit_new_user_page
        @users_page.add_new_user(
          user[:username],
          user[:email],
          user[:first_name],
          user[:last_name],
          user[:website],
          user[:password]
        )
      end

      it 'Verifies user can be created' do
        expect(page).to have_content(messages[:success_register])
      end

      it "Verifies user can't be created if username already exists" do
        expect(page).to have_content(messages[:warning_username])
      end

      it "Verifies user can't be created if e-mail already exists" do
        expect(page).to have_content(messages[:warning_email])
      end

      it 'Verifies if Add New User button is enabled' do
        expect(page).to have_button('Add New User')
      end
    end

    describe 'when specific test data is invalid' do
      before(:each) do
        @users_page = Users.new
        @users_page.open_main_page
        @users_page.visit_new_user_page
      end

      it "Verifies user can't be created if e-mail isn't correct" do
        @users_page.add_new_user(
          user[:username],
          'test',
          user[:first_name],
          user[:last_name],
          user[:website],
          user[:password]
        )
        expect(page).to have_content(messages[:incorrect_email])
      end
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

    it 'Verifies users role can be edited' do
      @users_page.change_users_role('John', 'Editor')
      expect(page).to have_content('Changed roles.')
    end

    it 'Verifies user can be deleted' do
      @users_page.delete_user('John')
      expect(page).to have_content('User deleted.')
    end

    it 'Verifies if Search Users button is enabled' do
      expect(page).to have_button('Search Users')
    end
  end
end
