# frozen_string_literal: true

class PropertyValueCombination
  attr_reader :properties_values

  def initialize(attributes)
    @properties_values = attributes[:properties_values]
  end

  def as_json
    properties_values.map(&:as_json)
  end

  def build_version; end
end

class PropertyValue
  attr_reader :property, :value

  def initialize(attributes)
    @property = attributes[:property]
    @value = attributes[:value]
  end

  def as_json
    {
      property_id: property.id,
      property_title: property.title,
      value: value
    }
  end
end
