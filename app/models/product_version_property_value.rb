# == Schema Information
#
# Table name: product_version_property_values
#
#  id                 :uuid             not null, primary key
#  value              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_version_id :uuid             not null
#  property_id        :uuid             not null
#
# Indexes
#
#  index_product_version_property_values_on_product_version_id  (product_version_id)
#  index_product_version_property_values_on_property_id         (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_version_id => product_versions.id)
#  fk_rails_...  (property_id => properties.id)
#
class ProductVersionPropertyValue < ApplicationRecord
  belongs_to :product_version
  belongs_to :property
end
