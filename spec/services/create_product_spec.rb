# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateProduct do
  describe '#perform' do
    it 'creates a product and its properties' do
      category = create(:category)
      params = {
        category_id: category.id,
        title: 'Specific Speed Bicycle',
        description: 'A great product.',
        properties: [
          { title: 'wheel size', values: %w[15 17] },
          { title: 'rim color', values: %w[black spotted red] }
        ]
      }
      service = described_class.new(params)

      service.perform

      expect(service.product).to be_persisted
      expect(service.product.properties.length).to be_eql(2)
    end

    # TODO: create invalid contexts
  end
end
