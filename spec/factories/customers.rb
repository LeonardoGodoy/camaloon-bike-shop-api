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
  factory :customer do
    sequence :name do |n|
      "Customer Example #{n}"
    end

    after(:build) do |customer, _evaluator|
      customer.email = "#{customer.name.parameterize}@email.com"
    end
  end
end
