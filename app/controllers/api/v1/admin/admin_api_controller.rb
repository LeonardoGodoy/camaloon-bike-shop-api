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
      end
    end
  end
end
