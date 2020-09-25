class Posts < BasePage
  def visit_new_post_page
    visit(Links::NEW_POST)
  end

  def add_new_post(user_input)
    fill_in 'Add title', with: user_input
    click_button('Publish')
    click_button('Publish')
  end
end
