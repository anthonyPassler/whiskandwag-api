# frozen_string_literal: true

FactoryBot.define do
  factory :medical_condition do
    id { SecureRandom.uuid }
    name { Faker::Food.dish }
    description { Faker::Food.description }
  end
end
