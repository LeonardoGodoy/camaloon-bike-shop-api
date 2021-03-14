# frozen_string_literal: true

module Api
  module V1
    module Admin
      class AdminApiController < ApplicationController
        before_action :authenticate

        # TODO: Add admin auth
        def authenticate
          # return if unauthorized?

          # render json: {
          #   message: I18n.t('api.v1.error_messages.unauthorized')
          # }, status: :unauthorized
        end

        def check(object_key)
          return if send(object_key).present?

          render json: {
            message: I18n.t('api.v1.error_messages.record_not_found')
          }, status: :unprocessable_entity
        end
      end
    end
  end
end
