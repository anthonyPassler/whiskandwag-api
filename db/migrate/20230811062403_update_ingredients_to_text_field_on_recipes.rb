# frozen_string_literal: true

class UpdateIngredientsToTextFieldOnRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :ingredients, nil
    change_column_null :recipes, :ingredients, true
  end
end
