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

  attribute :disabled_versions, if: :include_disabled_versions?

  has_many :properties

  def disabled_versions
    object.product_versions.where(enabled: false)
  end

  def include_disabled_versions?
    @instance_options[:include_disabled_versions]
  end
end
