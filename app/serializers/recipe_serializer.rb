# frozen_string_literal: true

class RecipeSerializer < ApplicationSerializer
  attribute(:name)
  attribute(:calories_per_100g)
  attribute(:ingredients)
  attribute(:fat_percentage)
  attribute(:image_url)
  attribute(:price_per_100g)
end
