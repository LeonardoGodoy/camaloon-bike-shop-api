# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateProductVersion do
  describe '#perform' do
    it 'creates a product version' do
      product = create(:product)
      property_combination = []
      params = {
        product: product,
        property_combination: property_combination
      }
      service = described_class.new(params)

      service.perform

      expect(service.product_version).to be_persisted
      expect(service.product_version).to be_enabled
    end
  end
end
