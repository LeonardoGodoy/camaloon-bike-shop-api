# frozen_string_literal: true

# == Schema Information
#
# Table name: product_versions
#
#  id                   :uuid             not null, primary key
#  enabled              :boolean
#  property_combination :jsonb
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_id           :uuid             not null
#
# Indexes
#
#  index_product_versions_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :product_version do
    enabled { true }
  end
end
