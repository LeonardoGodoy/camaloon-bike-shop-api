class ProductVersionPropertyValue < ApplicationRecord
  belongs_to :product_version
  belongs_to :property
end
