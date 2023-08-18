# frozen_string_literal: true

class RecommendedRecipe < ApplicationRecord
  belongs_to :dog
  belongs_to :recipe

  validates :dog_id, uniqueness: { scope: :recipe_id }
end
