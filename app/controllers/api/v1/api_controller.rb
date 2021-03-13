# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate

      def authenticate
        return if current_customer.present?

        head :unauthorized
      end

      def current_customer
        # TODO: Users auth: Get token from headers...
        @current_customer ||= Customer.first
      end
    end
  end
end
