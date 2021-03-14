# frozen_string_literal: true

class ApplicationController < ActionController::API
  def check(object_key)
    return if send(object_key).present?

    render json: {
      message: I18n.t('api.v1.error_messages.record_not_found')
    }, status: :unprocessable_entity
  end
end
