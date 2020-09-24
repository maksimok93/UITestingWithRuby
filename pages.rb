require_relative 'locators'
require 'capybara/dsl'

def get_file_content(filename)
  IO.readlines("#{filename}")
end

class BasePage
  include Capybara::DSL
  def open_main_page
    visit('/')
    fill_in 'user_login', :with => get_file_content("credentials.txt")[0]
    fill_in 'user_pass', :with => get_file_content("credentials.txt")[0]
    find(EntryPageLocators::LOGIN).click
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

module Pages
  include Capybara::DSL

  class Dashboard < BasePage
    def update_screen_options(option, mode="uncheck")
      find(DashboardLocators::SCREEN_OPTIONS).click
      case mode
      when "uncheck"
        uncheck(option)
      else
        check(option)
      end
      find(DashboardLocators::SCREEN_OPTIONS).click
    end

    def click_update_button
      click_button('Update Now')
    end
  end

  class Posts < BasePage
    def add_new_post(user_input)
      visit(Links::NEW_POST)
      fill_in 'Add title', :with => user_input
      find(PostsLocators::PUBLISH).click
    end
  end

  class Users < BasePage
    def visit_users_page
      visit(Links::USERS)
    end

    def add_new_user(username, email, first_name, last_name, website, password)
      visit(Links::NEW_USER)
      fill_in 'Username', :with => username
      fill_in 'Email', :with => email
      fill_in 'First Name', :with => first_name
      fill_in 'Last Name', :with => last_name
      fill_in 'Website', :with => website
      find(UsersLocators::SHOW_PASSWORD).click
      fill_in 'Password', :with => password
      find(UsersLocators::ADD_NEW_USER).click
    end

    def choose_user(name)
      click_link("#{name}")
    end

    def edit_user(role, first_name, last_name, website=nil)
      select "#{role}", from: "role"
      fill_in 'First Name', :with => first_name
      fill_in 'Last Name', :with => last_name
      fill_in 'Website', :with => website
      click_button('Update User')
    end

    def delete_user(name)
      check("Select #{name}")
      select 'Delete', from: UsersLocators::ACTIONS
      find(UsersLocators::APPLY).click
      click_button('Confirm Deletion')
    end
  end
end
