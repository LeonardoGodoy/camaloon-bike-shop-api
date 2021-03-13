# frozen_string_literal: true

class CreateProduct
  attr_reader :attributes, :properties_parser

  def initialize(attributes = {}, properties_parser = ParsePropertiesAttributes.new(self))
    @attributes = attributes
    @properties_parser = properties_parser
  end

  def perform
    product.save
    product.properties.create(properties_attributes)
  end

  def product
    @product ||= Product.new(product_attributes)
  end

  def properties_raw_attributes
    attributes[:properties]
  end

  private

  def product_attributes
    {
      title: attributes[:title],
      description: attributes[:description],
      category_id: category.id
    }
  end

  def category
    @category ||= Category.find_by(id: attributes[:category_id])
  end

  def properties_attributes
    properties_parser.parse_attributes!
  end
end
