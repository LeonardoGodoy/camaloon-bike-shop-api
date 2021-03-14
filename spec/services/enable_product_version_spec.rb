# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnableProductVersion do
  describe '#perform' do
    it 'enables the target version' do
      product = create(:product)
      product_version = create(:product_version, product: product, enabled: false)
      service = described_class.new(product_version)

      service.perform

      expect(service.product_version).to be_enabled
    end
  end
end
