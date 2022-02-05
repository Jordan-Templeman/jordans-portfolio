# frozen_string_literal: true

module Api
  class DocumentsController < ApplicationController
    # GET /documents - api_documents_path
    def index
      render json: Document.all
    end

    # GET /documents/:id - api_document_path(document)
    def show
      render json: Document.find(params[:id])
    end

    # POST /documents - api_documents_path
    def create
      document = Document.new(create_params)

      if document.save
        render json: document
      else
        render_errors(document)
      end
    end

    private

    def create_params
      params.permit(:title, :description)
    end
  end
end
