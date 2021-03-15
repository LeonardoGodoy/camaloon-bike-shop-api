# frozen_string_literal: true

class CreateProductVersion
  attr_reader :product, :property_combination

  def initialize(attributes)
    @product = attributes[:product]
    @property_combination = attributes[:property_combination]
  end

  def perform
    product_version.save

    product_version.property_values.create(properties_values_attributes)
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

  def properties_values_attributes
    property_combination.map do |property_values|
      property_values.slice(:property_id, :value)
    end
  end
end
