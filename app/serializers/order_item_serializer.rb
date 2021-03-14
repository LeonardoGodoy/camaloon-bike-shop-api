# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id                 :uuid             not null, primary key
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  order_id           :uuid             not null
#  product_id         :uuid             not null
#  product_version_id :uuid             not null
#
# Indexes
#
#  index_order_items_on_order_id            (order_id)
#  index_order_items_on_product_id          (product_id)
#  index_order_items_on_product_version_id  (product_version_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (product_version_id => product_versions.id)
#
class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at,
             :quantity

  belongs_to :product
  belongs_to :product_version
end
