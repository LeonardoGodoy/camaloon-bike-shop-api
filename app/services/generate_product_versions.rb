# frozen_string_literal: true

class GenerateProductVersions
  attr_reader :product, :combinations_generator

  def initialize(attributes)
    @product = attributes[:product]
    @combinations_generator = attributes[:combinations_generator] ||
                              GeneratePropertyCombinations.new(product.properties)
  end

  def perform
    property_combinations.map do |property_combination|
      create_product_version(property_combination)
    end
  end

  def create_product_version(property_combination)
    service = CreateProductVersion.new(product: product, property_combination: property_combination)
    service.perform
  end

  private

  def property_combinations
    combinations_generator.perform
    combinations_generator.property_combinations
  end
end
