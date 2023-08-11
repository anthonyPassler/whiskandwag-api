# frozen_string_literal: true

class UpdateRecipesTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :kcal_per_100g, :calories_per_100g
    change_column :recipes, :ingredients, :text
    remove_column :recipes, :allergens
    remove_column :recipes, :fussiness_levels
    remove_column :recipes, :health_issues
    remove_column :recipes, :is_selected
    rename_column :recipes, :price, :price_per_100g
  end
end
