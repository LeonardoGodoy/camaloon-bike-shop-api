# frozen_string_literal: true

class ParseOrderItemsAttributes
  attr_reader :order_items_source

  ACCEPTABLE_ATTRIBUTES = %i[
    quantity
    product_id
    properties_values
  ].freeze

  def self.parse_order_item_attributes(order_item_attributes)
    properties_values = order_item_attributes[:properties_values]
    product = Product.find(order_item_attributes[:product_id])
    service = FindProductVersionByPropertiesValues.new(product: product, properties_values: properties_values)
    product_version = service.perform

    {
      quantity: order_item_attributes[:quantity],
      product_id: order_item_attributes[:product_id],
      product_version_id: product_version.id
    }
  end

  def initialize(order_items_source)
    @order_items_source = order_items_source
  end

  def attributes
    order_items_source.raw_order_items_attributes
  end

  def parse_attributes!
    attributes.map! { |order_item_attributes| self.class.parse_order_item_attributes(order_item_attributes) }
  end

  def parse_attributes
    attributes.map { |order_item_attributes| self.class.parse_order_item_attributes(order_item_attributes) }
  end
end
