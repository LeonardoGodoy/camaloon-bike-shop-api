# frozen_string_literal: true

class ParsePropertiesAttributes
  attr_reader :property_source

  ACCEPTABLE_ATTRIBUTES = [
    :title,
    :values
  ].freeze

  def self.parse_property_attributes(property_attributes)
    property_attributes.slice(*ACCEPTABLE_ATTRIBUTES)
  end

  def initialize(property_source)
    @property_source = property_source
  end

  def attributes
    property_source.properties_raw_attributes
  end

  def parse_attributes!
    attributes.map! { |property_attributes| self.class.parse_property_attributes(property_attributes) }
  end

  def parse_attributes
    attributes.map { |property_attributes| self.class.parse_property_attributes(property_attributes) }
  end
end