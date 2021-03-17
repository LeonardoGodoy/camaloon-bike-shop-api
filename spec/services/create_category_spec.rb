# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateCategory do
  describe '#perform' do
    it 'creates a category and its properties' do
      params = {
        name: 'Speed Bicycle',
        properties: [
          { title: 'wheel size', values: %w[15 17 19] },
          { title: 'rim color', values: %w[blue black spotted] },
          { title: 'saddle color', values: %w[orange black] }
        ]
      }
      service = described_class.new(params)

      service.perform

      expect(service.category).to be_persisted
      expect(service.category.properties.reload.length).to be_eql(3)
    end

    # TODO: create invalid contexts
  end
end
