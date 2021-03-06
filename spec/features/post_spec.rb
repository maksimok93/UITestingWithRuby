# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'OpenSourceCMS Posts test', type: :feature do
  context 'When on Posts Page' do

    before(:each) do
      @posts_page = Posts.new
      @posts_page.open_main_page
    end

    it 'Verifies possibility of adding new post by user' do
      @posts_page.visit_new_post_page
      @posts_page.add_new_post('My test post')
      expect(page).to have_content('Post published.')
    end
  end
end
