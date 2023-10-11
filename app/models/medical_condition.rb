# frozen_string_literal: true

class MedicalCondition < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
