# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApiController
      def index
        products = Product.all

        render json: products, status: :ok
      end

      def show
        product = Product.find_by(id: params[:id])

        render json: product, status: :ok
      end

      def create
        create_service = CreateProduct.new(product_attributes)
        create_service.perform

        # TODO: Check success

        render json: create_service.product, status: :ok
      end

      private

      def product_attributes
        params.permit(:title, :description, properties: [:title, { values: [] }])
      end
    end
  end
end
