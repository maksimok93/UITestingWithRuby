require_relative '../spec_helper'

feature 'OpenSourceCMS Tools test', type: :feature do
  describe 'When on Tools Page' do

    before(:each) do
      @export_page = Export.new
      @export_page.open_main_page
      @export_page.visit_export_page
    end

    it 'Verifies if specific radio button is selected' do
      choose('Media')
      expect(find_field('Media').checked?).to eq(true)
    end

    it 'Verifies if specific radio button is not selected' do
      choose('Media')
      expect(find_field('Posts').checked?).to eq(false)
    end

    it 'Verifies if specific status in dropdown menu is selected' do
      choose('Posts')
      select 'Draft', from: ToolsLocators::STATUS
      expect(page).to have_select(ToolsLocators::STATUS, selected: 'Draft')
    end
  end
end

#TODO Disabled? button