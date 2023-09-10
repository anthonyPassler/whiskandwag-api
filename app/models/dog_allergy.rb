# frozen_string_literal: true

class DogAllergy < ApplicationRecord
  belongs_to :dog
  belongs_to :allergen
end
