# frozen_string_literal: true

class CreateDogMedicalConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :dog_medical_conditions, id: :uuid do |t|
      t.references :dog, type: :uuid, null: false, foreign_key: true
      t.references :medical_condition, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
