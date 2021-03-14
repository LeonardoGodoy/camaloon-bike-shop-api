# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :uuid             not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :product do
    sequence :title do |n|
      "Product Example #{n}"
    end
  end
end
