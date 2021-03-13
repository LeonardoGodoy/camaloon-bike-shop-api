# frozen_string_literal: true

class CreateCategory
  attr_reader :attributes, :properties_parser

  def initialize(attributes = {}, properties_parser = ParsePropertiesAttributes.new(self))
    @attributes = attributes
    @properties_parser = properties_parser
  end

  def perform
    category.save
    category.properties.create(properties_attributes)
  end

  def category
    @category ||= Category.new(category_attributes)
  end

  def properties_raw_attributes
    attributes[:properties]
  end

  private

  def category_attributes
    {
      name: attributes[:name]
    }
  end

  def properties_attributes
    properties_parser.parse_attributes!
  end
end
