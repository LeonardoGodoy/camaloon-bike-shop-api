# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :uuid             not null, primary key
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at,
             :title, :description

  has_many :properties
end
