# frozen_string_literal: true

class AddUniquenessToRecipesName < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes, :name, unique: true
  end
end
