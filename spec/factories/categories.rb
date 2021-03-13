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
  factory :category do
    sequence :name do |n|
      "Category #{n}"
    end
  end
end
