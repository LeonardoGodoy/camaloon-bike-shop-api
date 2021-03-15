# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApiController
      before_action :check_order, only: %i[show]

      def index
        orders = current_customer.orders.all

        render json: orders, status: :ok
      end

      def show
        include_options = { order_items: %i[product product_version] }

        render json: order, include: include_options, status: :ok
      end

      def create
        attributes = order_attributes
        attributes[:customer_id] = current_customer.id

        create_service = CreateOrder.new(attributes)
        create_service.perform

        # TODO: Check success

        render json: create_service.order, status: :ok
      end

      private

      def order_attributes
        params.permit(order_items: order_items_attribute_names)
      end

      def order_items_attribute_names
        [
          :product_id,
          :quantity,
          { properties_values: %i[property_id value] }
        ]
      end

      def order
        @order ||= Order.find_by(id: params[:id])
      end

      def check_order
        check(:order)
      end
    end
  end
end
