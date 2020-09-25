class Posts < BasePage
  def add_new_post(user_input)
    visit(Links::NEW_POST)
    fill_in 'Add title', with: user_input
    click_button('Publish')
    click_button('Publish')
  end
end
