# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DocumentsIndex', type: :system, js: true do
  let!(:document1) { create(:document) }
  let!(:document2) { create(:document) }

  it 'allows me to view Document(s)' do
    visit documents_path

    expect(page).to have_text 'Documents'

    within "#document-#{document1.id}" do
      expect(page).to have_text document1.title
      expect(page).to have_text document1.description
    end

    within "#document-#{document2.id}" do
      expect(page).to have_text document2.title
      expect(page).to have_text document2.description
    end
  end

  it 'allows me to navigate to create' do
    visit documents_path

    expect(page).to have_text 'Documents'

    click_link 'Create'

    expect(page).to have_current_path new_document_path
    expect(page).to have_text 'Document Create'
  end
end
