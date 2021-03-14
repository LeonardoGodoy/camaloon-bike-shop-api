# == Schema Information
#
# Table name: orders
#
#  id          :uuid             not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at

  has_many :order_items
end
