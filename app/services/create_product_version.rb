# frozen_string_literal: true

class CreateProductVersion
  attr_reader :product, :property_combination

  def initialize(attributes)
    @product = attributes[:product]
    @property_combination = attributes[:property_combination]
  end

  def perform
    product_version.save

    # TODO: Verify necessity of property_values association
    # product_version.values.create(...)
  end

  def product_version
    @product_version ||= product.product_versions.new(product_attributes)
  end

  private

  def product_attributes
    {
      enabled: true,
      property_combination: property_combination
    }
  end
end
