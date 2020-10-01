# frozen_string_literal: true

class Users < BasePage
  def visit_users_page
    visit(Links::USERS)
    on_page!
  end

  def visit_new_user_page
    visit(Links::NEW_USER)
    on_page!
  end

  def add_new_user(username, email, first_name, last_name, website, password)
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Website', with: website
    find(UsersLocators::SHOW_PASSWORD).click
    fill_in 'Password', with: password
    find(UsersLocators::ADD_NEW_USER).click
  end

  def choose_user(name)
    click_link(name)
  end

  def edit_user(role, first_name, last_name, website = nil)
    select role.to_s, from: 'role'
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Website', with: website
    click_button('Update User')
  end

  def delete_user(name)
    check("Select #{name}")
    choose_dropdown_component('Delete', UsersLocators::ACTIONS, UsersLocators::APPLY)
    click_button('Confirm Deletion')
  end

  def change_users_role(name, new_role)
    check("Select #{name}")
    choose_dropdown_component(new_role.to_s, UsersLocators::NEW_ROLE, UsersLocators::CHANGE)
  end
end
