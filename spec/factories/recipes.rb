# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    id { SecureRandom.uuid }
    name { Faker::Food.dish }
    calories_per_100g { Faker::Number.number(digits: 3) }
    ingredients { Faker::Food.ingredients }
    price_per_100g { Faker::Number.decimal(l_digits: 2) }
    fat_percentage { Faker::Number.decimal(l_digits: 2) }
  end
end
