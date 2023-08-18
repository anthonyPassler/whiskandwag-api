# frozen_string_literal: true

class AddUniquenessIndexToRecommendedRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :recommended_recipes, [:dog_id, :recipe_id], unique: true
  end
end
