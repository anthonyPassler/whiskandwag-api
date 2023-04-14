# frozen_string_literal: true

FactoryBot.define do
  factory :dog do
    name { Faker::Name.first_name }
    breed { Faker::Creature::Dog.breed }
    weight { rand(30) }
    age { rand(20) }
    gender { %w[female male].sample }
  end
end
