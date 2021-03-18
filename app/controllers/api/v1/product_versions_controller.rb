# frozen_string_literal: true

module Api
  module V1
    class ProductVersionsController < ApiController
      before_action :check_product

      def index
        product_versions = product.product_versions

        status_filter = search_attributes.dig(:search, :enabled)
        product_versions = product_versions.where(enabled: status_filter) unless status_filter.nil?

        render json: product_versions, status: :ok
      end

      private

      def product
        @product ||= Product.find_by(id: params[:product_id])
      end

      def search_attributes
        params.permit(search: [:enabled])
      end

      def check_product
        check(:product)
      end
    end
  end
end
