class Users < BasePage
  def visit_users_page
    visit(Links::USERS)
  end

  def add_new_user(username, email, first_name, last_name, website, password)
    visit(Links::NEW_USER)
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
    click_link("#{name}")
  end

  def edit_user(role, first_name, last_name, website=nil)
    select "#{role}", from: "role"
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Website', with: website
    click_button('Update User')
  end

  def delete_user(name)
    check("Select #{name}")
    select 'Delete', from: UsersLocators::ACTIONS
    find(UsersLocators::APPLY).click
    click_button('Confirm Deletion')
  end
end
