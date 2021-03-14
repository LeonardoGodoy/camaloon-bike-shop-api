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
        # order = nil
        # render json: order, status: :ok

        head :ok
      end

      private

      def order
        @order ||= Order.find_by(id: params[:id])
      end

      def check_order
        check(:order)
      end
    end
  end
end
