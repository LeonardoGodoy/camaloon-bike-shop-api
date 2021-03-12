# frozen_string_literal: true

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
