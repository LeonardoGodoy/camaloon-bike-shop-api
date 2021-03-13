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
class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :product_versions
  has_many :properties

  validates :title, presence: true
end
