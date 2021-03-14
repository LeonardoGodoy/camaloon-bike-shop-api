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
    generate_product_versions
  end

  def product
    @product ||= Product.new(product_attributes)
  end

  def raw_properties_attributes
    attributes[:properties]
  end

  private

  def product_attributes
    {
      title: attributes[:title],
      description: attributes[:description],
      category_id: category.try(:id)
    }
  end

  def category
    @category ||= Category.find_by(id: attributes[:category_id])
  end

  def properties_attributes
    properties_parser.parse_attributes!
  end

  def generate_product_versions
    GenerateProductVersions.new(product: product).perform
  end
end
