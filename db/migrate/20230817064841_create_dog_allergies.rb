# frozen_string_literal: true

class CreateDogAllergies < ActiveRecord::Migration[7.0]
  def change
    create_table :dog_allergies, id: :uuid do |t|
      t.references :dog, null: false, foreign_key: true, type: :uuid
      t.references :allergen, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
