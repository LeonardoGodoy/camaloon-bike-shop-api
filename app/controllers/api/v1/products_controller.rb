# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApiController
      before_action :check_product, only: %i[show]

      def index
        products = Product.all

        render json: products, status: :ok
      end

      def show
        render json: product, include_disabled_versions: true, status: :ok
      end

      private

      def product
        @product ||= Product.find_by(id: params[:id])
      end

      def check_product
        check(:product)
      end
    end
  end
end
