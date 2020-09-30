require_relative '../spec_helper'

feature 'OpenSourceCMS Tools test', type: :feature do
  describe 'When on Tools Page' do

    before(:each) do
      @export_page = Export.new
      @export_page.open_main_page
      @export_page.visit_export_page
    end

    it 'Verifies if "Media" radio button is selected' do
      choose('Media')
      expect(find_field('Media').checked?).to eq(true)
    end

    it 'Verifies if "Posts" radio button is not selected' do
      choose('Media')
      expect(find_field('Posts').checked?).to eq(false)
    end

    it 'Verifies if "Draft" status in dropdown menu is selected' do
      choose('Posts')
      select 'Draft', from: ToolsLocators::STATUS
      expect(page).to have_select(ToolsLocators::STATUS, selected: 'Draft')
    end

    it 'Verifies if "Download Export File" button is enabled' do
      expect(page).to have_button('Download Export File')
    end
  end
end
