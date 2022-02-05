# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Documents#index', type: :request do
  describe 'Retrieving Documents' do
    context 'when there are Document(s)' do
      let!(:documents) { create_list(:document, 2) }

      it 'returns JSON response of Document(s)' do
        get api_documents_path

        expect(response).to have_http_status(:success)
        expect_json_types('*', document_json_types)
        expect_json(documents.map { |document| document_json(document) })
      end
    end

    context 'when there are no documents' do
      it 'returns JSON response with empty array' do
        get api_documents_path

        expect(response).to have_http_status(:success)
        expect_json([])
      end
    end
  end
end
