class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :product_versions
  has_many :properties
end
