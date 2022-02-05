# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DocumentShow', type: :system, js: true do
  context 'when the document can be found' do
    let!(:document) { create(:document) }

    it 'allows me to view the Document' do
      visit document_path(document)

      expect(page).to have_text 'Document'

      within "#document-#{document.id}" do
        expect(page).to have_text document.title
        expect(page).to have_text document.description

        expect(page).to have_no_text 'View'
      end
    end

    it 'allows me to navigate to root' do
      visit document_path(document)

      expect(page).to have_text 'Document'

      click_link 'Home'

      expect(page).to have_current_path '/'
      expect(page).to have_text 'Document'
    end
  end

  context 'when the document can NOT be found' do
    let(:bad_id) { 12345 }
    let(:error_message) { 'The resource you are looking for cannot be found!' }

    it 'returns error message' do
      visit document_path(bad_id)

      expect(page).to have_text error_message
    end
  end
end
