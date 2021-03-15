# frozen_string_literal: true

class CreateOrder
  attr_reader :attributes, :order_items_parser

  def initialize(attributes = {}, order_items_parser = ParseOrderItemsAttributes.new(self))
    @attributes = attributes
    @order_items_parser = order_items_parser
  end

  def perform
    order.save
    create_order_items
  end

  def order
    @order ||= Order.new(order_attributes)
  end

  def raw_order_items_attributes
    attributes[:order_items]
  end

  private

  def order_attributes
    {
      customer_id: attributes[:customer_id]
    }
  end

  def create_order_items
    order.order_items.create(order_items_attributes)
  end

  def order_items_attributes
    order_items_parser.parse_attributes!
  end
end
