# frozen_string_literal: true

FactoryBot.define do
  factory :dog do
    id { SecureRandom.uuid }
    name { Faker::Name.first_name }
    breed { Faker::Creature::Dog.breed }

    weight { 20 }
    age_in_months { 60 }
    gender { "female" }
  end
end
