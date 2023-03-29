# frozen_string_literal: true

class RecipeSerializer < ApplicationSerializer
  attribute(:name)
  attribute(:kcal_per_100g)
  attribute(:ingredients)
  attribute(:allergens)
  attribute(:fat_percentage)
  attribute(:is_selected)
  attribute(:image_url)
  attribute(:price)
end
