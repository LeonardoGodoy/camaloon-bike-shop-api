# == Schema Information
#
# Table name: properties
#
#  id          :uuid             not null, primary key
#  title       :string
#  values      :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#  product_id  :uuid
#
# Indexes
#
#  index_properties_on_category_id  (category_id)
#  index_properties_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (product_id => products.id)
#
class Property < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :product, optional: true
end
