# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductsController < AdminApiController
        before_action :check_product, only: %i[show]

        def index
          products = Product.all

          render json: products, status: :ok
        end

        def show
          render json: product, status: :ok
        end

        def create
          create_service = CreateProduct.new(product_attributes)
          create_service.perform

          # TODO: Check success

          render json: create_service.product, status: :ok
        end

        private

        def product
          @product ||= Product.find_by(id: params[:id])
        end

        def product_attributes
          params.permit(:title, :description, properties: [:title, { values: [] }])
        end

        def product_version
          @product_version ||= ProductVersion.find_by(id: params[:id])
        end

        def check_product
          check(:product)
        end
      end
    end
  end
end
