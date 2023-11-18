# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_medical_condition_exclusion do
    id { SecureRandom.uuid }

    recipe { create(:recipe) }
    medical_condition { create(:medical_condition) }
  end
end
