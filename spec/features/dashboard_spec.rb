require 'capybara/rspec'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS Dashboard test', type: :feature do
  describe 'When on Dashboard Page' do

    before(:each) do
      @dashboard_page = Pages::Dashboard.new
      @dashboard_page.open_main_page
    end

    it 'Verifies presence of next text: WordPress 5.5.1 is available!' do
      expect(page).to have_content("WordPress 5.5.1 is available!")
    end

    it 'Verifies presence of "Customize Your Site" button' do
      expect(page).to have_selector(:link_or_button, "Customize Your Site")
    end

    it 'Verifies presence of "New" dropdown menu' do
      expect(page).to have_select("wp-admin-bar-new-content", :with_options => %w[Post Media Page Users])
    end
  end
end
