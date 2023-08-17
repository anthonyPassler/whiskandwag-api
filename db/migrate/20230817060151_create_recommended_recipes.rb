# frozen_string_literal: true

class CreateRecommendedRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recommended_recipes, id: :uuid do |t|
      t.references :dog, type: :uuid, foreign_key: true
      t.references :recipe, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
