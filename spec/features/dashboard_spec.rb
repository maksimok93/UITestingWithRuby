require 'capybara/rspec'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS Dashboard test', type: :feature do
  describe Pages::Dashboard do

    before(:each) do
      @dashboard_page = Pages::Dashboard.new
      @dashboard_page.open_main_page
    end

    it "#Presence of text: WordPress 5.5.1 is available!" do
      expect(page).to have_content("WordPress 5.5.1 is available!")
    end

    it "#Presence of 'Save Draft' button" do
      expect(page).to have_selector(:link_or_button, "Save Draft")
    end

    it "#Presence of 'New' dropdown menu" do
      expect(page).to have_select("wp-admin-bar-new-content", :with_options => %w[Post Media Page Users])
    end
  end
end
