# frozen_string_literal: true

class UpdateNameOnMedicalConditions < ActiveRecord::Migration[7.0]
  def change
    change_column :medical_conditions, :name, :string, null: false, index: { unique: true }
  end
end
