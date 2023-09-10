# frozen_string_literal: true

FactoryBot.define do
  factory :dog_allergy do
    id { SecureRandom.uuid }

    dog { create(:dog) }
    allergen { create(:allergen) }
  end
end
