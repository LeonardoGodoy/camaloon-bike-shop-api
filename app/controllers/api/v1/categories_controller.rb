# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      before_action :check_category, only: %i[show]

      def index
        categories = Category.all

        render json: categories, status: :ok
      end

      def show
        render json: category, status: :ok
      end

      def create
        create_service = CreateCategory.new(category_attributes)
        create_service.perform

        # TODO: Check success

        render json: create_service.category, status: :ok
      end

      private

      def category
        @category ||= Category.find_by(id: params[:id])
      end

      def category_attributes
        params.permit(:name, properties: [:title, { values: [] }])
      end

      def check_category
        check(:category)
      end
    end
  end
end
