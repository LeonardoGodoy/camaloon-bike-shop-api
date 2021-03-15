# frozen_string_literal: true

class FindProductVersionByPropertiesValues
  attr_reader :product, :properties_values, :property_index

  def initialize(attributes = {})
    @product = attributes[:product]
    @properties_values = attributes[:properties_values]
    @property_index = 0
  end

  def perform
    product_version
  end

  def product_version
    @product_version ||= product_version_scope.first
  end

  private

  def product_version_scope
    base_scope = product.product_versions
                        .where(enabled: true)

    properties_values.inject(base_scope) do |scope, property_value|
      join_statement = join_property(property_value[:property_id], property_value[:value])

      scope.joins(join_statement)
    end
  end

  def join_property(property_id, value)
    @property_index += 1
    property_value = ProductVersionPropertyValue.where(property_id: property_id, value: value).to_sql

    <<-SQL
      inner join (
        #{property_value}
      ) as property_#{property_index}
      on property_#{property_index}.product_version_id = product_versions.id
    SQL
  end
end
