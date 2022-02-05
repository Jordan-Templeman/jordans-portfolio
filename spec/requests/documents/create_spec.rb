# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Documents#create', type: :request do
  describe 'Creating a document' do
    let(:title) { Faker::Company.bs.titleize }
    let(:params) do
      {
        title: title,
        description: description
      }
    end

    context 'when the Document is created successfully' do
      let(:description) { Faker::Lorem.sentence }

      it 'returns JSON response of the Document' do
        post api_documents_path, params: params

        expect(response).to have_http_status(:success)
        expect_json_types(document_json_types)
        expect_json(document_json(Document.last))
      end
    end

    context 'when the document is NOT created with errors' do
      let(:description) { nil }

      it 'returns a 422' do
        post api_documents_path, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect_json_types(errors: :object, full_messages: :string)
        expect_json(
          errors: { description: ["can't be blank"] },
          full_messages: "Description can't be blank"
        )
      end
    end
  end
end
