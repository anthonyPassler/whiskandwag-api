# frozen_string_literal: true

class DogMedicalCondition < ApplicationRecord
  belongs_to :dog
  belongs_to :medical_condition
end
