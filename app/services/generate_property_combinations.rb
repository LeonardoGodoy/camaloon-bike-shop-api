# frozen_string_literal: true

class GeneratePropertyCombinations
  attr_reader :properties, :property_combinations

  def initialize(properties)
    @properties = properties
    @property_combinations = []
  end

  def perform
    generate_combinations
  end

  private

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def generate_combinations(current_combination = [], property_index = 0, value_index = 0)
    property = properties[property_index]
    value = property.values[value_index]

    return if value.blank?

    original_combination = current_combination.dup
    current_combination.push(value: value, property_id: property.id, property_title: property.title)

    next_property_index = property_index + 1
    next_property = properties[next_property_index]

    if next_property.present?
      generate_combinations(current_combination, next_property_index, 0)
    else
      property_combinations.push(current_combination)
    end

    next_value_index = value_index + 1
    generate_combinations(original_combination, property_index, next_value_index)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
