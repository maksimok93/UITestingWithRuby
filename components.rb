module Components

  def choose_dropdown_component(option, visible_option, button)
    select option, from: visible_option
    find(button).click
  end
end


