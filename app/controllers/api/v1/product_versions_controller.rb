# frozen_string_literal: true

module Api
  module V1
    class ProductVersionsController < ApiController
      before_action :check_product, only: %i[enable disable]
      before_action :check_product_version, only: %i[enable disable]

      def index
        product_versions = product.product_versions

        render json: product_versions, status: :ok
      end

      def enable
        enable_service = EnableProductVersion.new(product_version)
        enable_service.perform

        render json: product_version, status: :ok
      end

      def disable
        disable_service = DisableProductVersion.new(product_version)
        disable_service.perform

        render json: product_version, status: :ok
      end

      private

      def product
        @product ||= Product.find_by(id: params[:product_id])
      end

      def product_version
        @product_version ||= product.product_versions.find_by(id: params[:product_version_id])
      end

      def check_product
        check(:product)
      end

      def check_product_version
        check(:product_version)
      end

      # def search_attributes
      #   params.permit(:title, :description, properties: [:title, { values: [] }])
      # end
    end
  end
end
