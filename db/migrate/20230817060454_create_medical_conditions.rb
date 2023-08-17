# frozen_string_literal: true

class CreateMedicalConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_conditions, id: :uuid do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
