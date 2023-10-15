# frozen_string_literal: true

class DogMedicalCondition
  class Create < ApplicationService
    def call
      add_error!("Invalid medical condition") unless MedicalCondition.exists?(id: medical_condition_id)
      add_error!("Invalid dog") unless Dog.exists?(id: dog_id)
      add_error!("Dog medical condition already exists") if DogMedicalCondition.exists?(dog_id:, medical_condition_id:)

      dog_medical_condition = DogMedicalCondition.new(medical_condition_id:, dog_id:)

      authorize(dog_medical_condition, :create?)

      add_service_result(dog_medical_condition) if dog_medical_condition.save!
    end
  end
end
