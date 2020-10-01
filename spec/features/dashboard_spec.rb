# frozen_string_literal: true

require_relative '../spec_helper'

feature 'OpenSourceCMS Dashboard test', type: :feature do
  describe 'When on Dashboard Page' do
    before(:each) do
      @dashboard_page = Dashboard.new
      @dashboard_page.open_main_page
    end

    it 'Verifies presence of next text: WordPress 5.5.1 is available!' do
      expect(page).to have_content('WordPress 5.5.1 is available!')
    end

    it 'Verifies presence of "Customize Your Site" button' do
      expect(page).to have_selector(:link_or_button, 'Customize Your Site')
    end

    it 'Verifies presence of "New" dropdown menu' do
      expect(page).to have_select('wp-admin-bar-new-content', with_options: %w[Post Media Page Users])
    end

    it 'Verifies if "At a Glance" checkbox is selected' do
      find(DashboardLocators::SCREEN_OPTIONS).click
      expect(page).to have_field('At a Glance', checked: true)
    end

    it 'Verifies if "Quick Draft" checkbox is not selected' do
      find(DashboardLocators::SCREEN_OPTIONS).click
      @dashboard_page.update_screen_options('Quick Draft')
      expect(page).to have_field('Quick Draft', checked: false)
    end
  end
end
