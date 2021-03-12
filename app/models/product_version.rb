class ProductVersion < ApplicationRecord
  belongs_to :product
  has_many :property_values, class_name: 'ProductVersionPropertyValue'
end
