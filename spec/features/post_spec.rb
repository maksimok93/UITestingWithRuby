require 'capybara/rspec'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS Posts test', type: :feature do
  describe Pages::Posts do

    before(:each) do
      @posts_page = Pages::Posts.new
      @posts_page.open_main_page
    end

    it "#add_new_post" do
      @posts_page.add_new_post("My test post")
      expect(page).to have_content("Post published.")
    end
  end
end
