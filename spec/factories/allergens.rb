# frozen_string_literal: true

FactoryBot.define do
  factory :allergen do
    id { SecureRandom.uuid }
    name { Faker::Food.unique.ingredient }
  end
end
