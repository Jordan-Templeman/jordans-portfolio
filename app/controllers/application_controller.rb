# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: {
      errors: { message: I18n.t('record_not_found') },
      full_messages: I18n.t('record_not_found')
    }, status: :not_found
  end

  def render_errors(errors_object)
    render json: {
      errors: errors_object.errors,
      full_messages: errors_object.errors.full_messages.join(', ')
    }, status: :unprocessable_entity
  end
end
