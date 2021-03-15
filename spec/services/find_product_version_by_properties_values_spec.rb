# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindProductVersionByPropertiesValues do
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
    it 'creates a category and its properties' do
      product_data = create_product
      params = {
        product: product_data[:product],
        properties_values: [
          { property_id: product_data[:property1].id, value: '21' },
          { property_id: product_data[:property2].id, value: 'blue' }
        ]
      }
      service = described_class.new(params)

      service.perform

      expect(service.product_version).to be_present
    end
  end
end
