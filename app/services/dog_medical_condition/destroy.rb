# frozen_string_literal: true

class DogMedicalCondition
  class Destroy < ApplicationService
    def call
      dog_medical_condition = DogMedicalCondition.find_by!(dog_id:, medical_condition_id:)

      authorize(dog_medical_condition, :destroy?)

      dog_medical_condition.destroy!
    end
  end
end
