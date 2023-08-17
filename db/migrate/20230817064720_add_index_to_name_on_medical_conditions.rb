# frozen_string_literal: true

class AddIndexToNameOnMedicalConditions < ActiveRecord::Migration[7.0]
  def change
    add_index :medical_conditions, :name, unique: true
  end
end
