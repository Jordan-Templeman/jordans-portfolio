# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Documents#show', type: :request do
  describe 'Retrieving Document by id' do
    context 'when the Document can be found' do
      let(:document) { create(:document) }

      it 'returns JSON response of the Document' do
        get api_document_path(document)

        expect(response).to have_http_status(:success)
        expect_json_types(document_json_types)
        expect_json(document_json(document))
      end
    end

    context 'when the document is NOT found' do
      it 'returns a 404' do
        get api_document_path(id: '1')

        expect(response).to have_http_status(:not_found)
        expect_json_types(errors: :object, full_messages: :string)
        expect_json(
          errors: { message: 'The resource you are looking for cannot be found!' },
          full_messages: 'The resource you are looking for cannot be found!'
        )
      end
    end
  end
end
