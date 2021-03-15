# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateOrder do
  def create_product
    product = create(:product)
    property1 = create(:property, product: product, title: 'wire size', values: %i[17 21])
    property2 = create(:property, product: product, title: 'main color', values: %i[blue green])
    GenerateProductVersions.new(product: product).perform

    {
      product: product,
      property1: property1,
      property2: property2
    }
  end

  describe '#perform' do
    it 'creates an order and its items' do
      customer = create(:customer)
      product_data = create_product
      params = {
        customer_id: customer.id,
        order_items: [
          {
            quantity: 2,
            product_id: product_data[:product].id,
            properties_values: [
              { property_id: product_data[:property1].id, value: '21' },
              { property_id: product_data[:property2].id, value: 'blue' }
            ]
          }
        ]
      }
      service = described_class.new(params)

      service.perform

      expect(service.order).to be_persisted
      expect(service.order.order_items.reload.length).to be_eql(1)
    end

    # TODO: create invalid contexts
  end
end
