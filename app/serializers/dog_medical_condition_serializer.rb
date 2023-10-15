# frozen_string_literal: true

class DogMedicalConditionSerializer < ApplicationSerializer
  has_one(:medical_condition)
  has_one(:dog)
end
