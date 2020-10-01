# frozen_string_literal: true

class Dashboard < BasePage
  def update_screen_options(option, mode = 'uncheck')
    find(DashboardLocators::SCREEN_OPTIONS).click
    case mode
    when 'uncheck'
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
