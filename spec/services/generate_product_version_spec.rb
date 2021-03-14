# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenerateProductVersions do
  class CustomGenerator
    def initialize(combinations = [])
      @combinations = combinations
    end

    def perform; end

    def property_combinations
      @combinations
    end
  end

  describe '#perform' do
    context 'without any combination' do
      it 'does not create versions' do
        product = create(:product)
        service = described_class.new(product: product, combinations_generator: CustomGenerator.new)

        results = service.perform

        expect(results).to be_blank
      end
    end

    context 'with combinations' do
      it 'create one version for each' do
        product = create(:product)
        combinations = [
          [
            { value: '1', property_id: nil, property_title: 'property_1' },
            { value: '2', property_id: nil, property_title: 'property_2' }
          ]
        ]
        combinations_generator = CustomGenerator.new(combinations)
        service = described_class.new(product: product, combinations_generator: combinations_generator)

        results = service.perform

        expect(results.length).to be_eql(1)
      end
    end
  end
end
