require_relative '../locators'
require 'capybara/dsl'

class BasePage
  include Capybara::DSL

  private

  def get_file_content(filename)
    IO.readlines("#{filename}")
  end

  public

  def on_page?
    find(:css, LeftMenuLocators::LEFT_MENU).visible?
  end

  def on_page!
    raise "#{self.class.name} not on expected page" unless on_page?
  end

  def open_main_page
    visit('/')
    fill_in 'user_login', with: get_file_content('credentials.txt')[0]
    fill_in 'user_pass', with: get_file_content('credentials.txt')[0]
    find(EntryPageLocators::LOGIN).click
    on_page!
  end

  def click_opensourcecms
    find(HeaderLocators::OPENSOURCECMS).click
  end

  def click_update_button
    find(HeaderLocators::UPDATE).click
  end

  def click_edit_comments
    find(HeaderLocators::EDIT_COMMENTS).click
  end

  def click_users
    find(UsersLocators::USERS).click
  end

  def new_dropdown
    select('Post', from: HeaderLocators::NEW)
  end
end
