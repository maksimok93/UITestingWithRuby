require 'capybara/rspec'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS Posts test', type: :feature do
  describe 'When on Posts Page' do

    before(:each) do
      @posts_page = Pages::Posts.new
      @posts_page.open_main_page
    end

    it 'Verifies possibility of adding new post by user' do
      @posts_page.add_new_post("My test post")
      expect(page).to have_content("Post published.")
    end
  end
end
