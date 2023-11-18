# frozen_string_literal: true

class RecipeMedicalConditionExclusion < ApplicationRecord
  belongs_to :recipe
  belongs_to :medical_condition
end
