# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    id { SecureRandom.uuid }
    total_price { Faker::Number.decimal(l_digits: 2) }
  end
end
