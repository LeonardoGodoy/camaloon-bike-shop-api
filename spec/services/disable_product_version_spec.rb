# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisableProductVersion do
  describe '#perform' do
    it 'disables the target version' do
      product = create(:product)
      product_version = create(:product_version, product: product, enabled: true)
      service = described_class.new(product_version)

      service.perform

      expect(service.product_version).to be_disabled
    end
  end
end
