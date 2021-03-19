# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: 'Camaloon Customer', email: 'camaloon_customer@gmail.com')

content = File.read(Rails.root.join('db', 'seeds.json'))
data = JSON.parse(content, symbolize_names: true)

def create_category(attributes)
  create_category = CreateCategory.new(attributes.slice(:name, :properties))
  create_category.perform
  create_category.category
end

def create_product(category, attributes)
  attributes[:category_id] = category.id
  create_product = CreateProduct.new(attributes)
  create_product.perform
  create_product.product
end

def disable_combination(product, combination, properties)
  properties_values = combination.map do |property_value|
    title = property_value[:title]
    value = property_value[:value]
    { property_id: properties[title], value: value }
  end

  disable_version_combination(product, properties_values)
end

def disable_version_combination(product, properties_values)
  finder_attributes = {
    product: product,
    properties_values: properties_values
  }
  version = FindProductVersionByPropertiesValues.new(finder_attributes).perform
  DisableProductVersion.new(version).perform
end

data[:categories].each do |category_attributes|
  category = create_category(category_attributes)

  category_attributes[:products].each do |product_attributes|
    product = create_product(category, product_attributes.except(:disabled_combinations))
    properties = product.properties.inject({}) do |hash, property|
      hash.merge(property.title => property.id)
    end

    next if product_attributes[:disabled_combinations].blank?

    product_attributes[:disabled_combinations].each do |combination|
      disable_combination(product, combination, properties)
    end
  end
end
