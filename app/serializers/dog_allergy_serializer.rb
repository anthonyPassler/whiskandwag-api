# frozen_string_literal: true

class DogAllergySerializer < ApplicationSerializer
  has_one(:allergen)
  has_one(:dog)
end
