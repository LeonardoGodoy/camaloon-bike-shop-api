# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate

      def authenticate
        return if current_customer.present?

        render json: {
          message: I18n.t('api.v1.error_messages.unauthorized')
        }, status: :unauthorized
      end

      def current_customer
        # TODO: Users auth: Get token from headers...
        @current_customer ||= Customer.first
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
