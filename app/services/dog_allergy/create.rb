# frozen_string_literal: true

class DogAllergy
  class Create < ApplicationService
    def call
      add_error!("Invalid allergen") unless Allergen.exists?(id: allergen_id)
      add_error!("Invalid dog") unless Dog.exists?(id: dog_id)
      add_error!("Dog allergy already exists") if DogAllergy.exists?(dog_id: dog_id, allergen_id: allergen_id)

      dog_allergy = DogAllergy.create!(allergen_id: allergen_id, dog_id: dog_id)

      add_service_result(dog_allergy)
    end
  end
end
