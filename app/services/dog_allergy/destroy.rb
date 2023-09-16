# frozen_string_literal: true

class DogAllergy
  class Destroy < ApplicationService
    def call
      dog_allergy = DogAllergy.find_by!(dog_id:, allergen_id:)

      authorize(dog_allergy, :destroy?)

      dog_allergy.destroy!
    end
  end
end
