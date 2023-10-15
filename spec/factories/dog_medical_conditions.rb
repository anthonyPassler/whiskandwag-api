# frozen_string_literal: true

FactoryBot.define do
  factory :dog_medical_condition do
    id { SecureRandom.uuid }

    dog { create(:dog) }
    medical_condition { create(:medical_condition) }
  end
end
