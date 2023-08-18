# frozen_string_literal: true

FactoryBot.define do
  factory :recommended_recipe do
    id { SecureRandom.uuid }

    dog { create(:dog) }
    recipe { create(:recipe) }
  end
end
