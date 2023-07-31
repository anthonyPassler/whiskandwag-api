# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    id { SecureRandom.uuid }
    total_price { Faker::Number.decimal(l_digits: 2) }
    portions { Faker::Number.number(digits: 2) }
    portion_weight_in_grams { Faker::Number.number(digits: 4) }
  end
end
