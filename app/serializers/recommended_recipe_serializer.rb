# frozen_string_literal: true

class RecommendedRecipeSerializer < ApplicationSerializer
  has_one(:recipe)
  has_one(:dog)
end
