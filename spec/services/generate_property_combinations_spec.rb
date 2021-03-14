# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeneratePropertyCombinations do
  def should_include_all_combinations(combinations, combinations_values)
    values = combinations.map { |properties| properties.pluck(:value) }

    success = combinations_values.all? do |combination_values|
      values.include?(combination_values)
    end

    expect(success).to be_truthy
  end

  def should_not_repeat_combinations(combinations)
    original_length = combinations.length
    uniq_length = combinations.uniq.length

    expect(original_length).to be_eql(uniq_length)
  end

  describe '#perform' do
    context 'with simple properties' do
      it 'returns a collection of all properties combinations' do
        properties = [
          Property.new(title: 'number', values: [1, 2]),
          Property.new(title: 'letter', values: %w[a b])
        ]
        service = described_class.new(properties)

        service.perform

        expected_combinations = [
          [1, 'a'],
          [1, 'b'],
          [2, 'a'],
          [2, 'b']
        ]
        should_not_repeat_combinations(service.property_combinations)
        should_include_all_combinations(service.property_combinations, expected_combinations)
      end
    end

    context 'with complex properties' do
      it 'returns a collection of all properties combinations' do
        properties = [
          Property.new(title: 'number', values: [1, 2, 3]),
          Property.new(title: 'letter', values: %w[a b]),
          Property.new(title: 'symbols', values: %w[! ?])
        ]
        service = described_class.new(properties)

        service.perform

        expected_combinations = [
          [1, 'a', '!'],
          [1, 'a', '?'],
          [1, 'b', '!'],
          [1, 'b', '?'],
          [2, 'a', '!'],
          [2, 'a', '?'],
          [2, 'b', '!'],
          [2, 'b', '?'],
          [3, 'a', '!'],
          [3, 'a', '?'],
          [3, 'b', '!'],
          [3, 'b', '?']
        ]
        should_not_repeat_combinations(service.property_combinations)
        should_include_all_combinations(service.property_combinations, expected_combinations)
      end
    end
  end
end
