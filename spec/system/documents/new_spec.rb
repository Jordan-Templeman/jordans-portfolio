# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DocumentNew', type: :system, js: true do
  context 'when the Document is created successfully' do
    let(:title) { Faker::Company.bs.titleize }
    let(:description) { Faker::Lorem.sentence }

    it 'allows me to view the Document' do
      visit new_document_path

      expect(page).to have_text 'Document Create'

      within '#document-form' do
        fill_in 'Title', with: title
        fill_in 'Description', with: description

        click_button 'Submit'
      end

      expect(page).to have_current_path root_path
      expect(page).to have_text title
      expect(page).to have_text description
    end

    it 'allows me to navigate to root' do
      visit new_document_path

      expect(page).to have_text 'Document'

      click_link 'Home'

      expect(page).to have_current_path '/'
      expect(page).to have_text 'Document'
    end
  end

  context 'when the document is NOT created with errors' do
    let(:error_message) { "can't be blank" }

    it 'returns validation message for missing values' do
      visit new_document_path

      within '#document-form' do
        click_button 'Submit'
      end

      within '.title-field' do
        expect(page).to have_text error_message
      end

      within '.description-field' do
        expect(page).to have_text error_message
      end
    end
  end
end
