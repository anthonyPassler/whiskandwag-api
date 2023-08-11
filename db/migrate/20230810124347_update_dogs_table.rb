# frozen_string_literal: true

class UpdateDogsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :dogs, :age, :age_in_months
    rename_column :dogs, :kcal_per_day, :recommended_daily_calories
    remove_column :dogs, :health_issues
    remove_column :dogs, :allergies
    add_column :dogs, :sterialized, :boolean
  end
end
