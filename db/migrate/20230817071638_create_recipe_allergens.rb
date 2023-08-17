# frozen_string_literal: true

class CreateRecipeAllergens < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_allergens, id: :uuid do |t|
      t.references :recipe, null: false, foreign_key: true, type: :uuid
      t.references :allergen, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
