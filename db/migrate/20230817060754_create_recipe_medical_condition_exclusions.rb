# frozen_string_literal: true

class CreateRecipeMedicalConditionExclusions < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_medical_condition_exclusions, id: :uuid do |t|
      t.references :recipe, null: false, foreign_key: true, type: :uuid
      t.references :medical_condition, null: false, foreign_key: true, type: :uuid, index: { name: 'index_recipe_exclusions_on_medical_condition_id' }

      t.timestamps
    end
  end
end
