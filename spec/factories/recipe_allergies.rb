# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_allergy do
    id { SecureRandom.uuid }

    recipe { create(:recipe) }
    allergen { create(:allergen) }
  end
end
