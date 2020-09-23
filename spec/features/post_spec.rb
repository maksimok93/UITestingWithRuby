require 'capybara/rspec'
require 'capybara'
require 'selenium-webdriver'
require_relative '../../spec/spec_helper'
require_relative '../../pages'
require_relative '../../locators'

feature 'OpenSourceCMS Posts test', type: :feature do
  describe Pages::Posts do

    before(:each) do
      @session = Pages::Posts.new
      @session.open_main_page
    end

    it "#add_new_post" do
      @session.add_new_post("My test post")
      expect(page).to have_content("Post published.")
    end
  end
end
