# frozen_string_literal: true

class DogAllergy
  class Create < ApplicationService
    def call
      add_error!("Invalid allergen") unless Allergen.exists?(id: allergen_id)
      add_error!("Invalid dog") unless Dog.exists?(id: dog_id)
      add_error!("Dog allergy already exists") if DogAllergy.exists?(dog_id:, allergen_id:)

      dog_allergy = DogAllergy.new(allergen_id:, dog_id:)

      authorize(dog_allergy, :create?)

      add_service_result(dog_allergy) if dog_allergy.save!
    end
  end
end
