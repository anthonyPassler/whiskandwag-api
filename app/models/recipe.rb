# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :recipe_allergens, dependent: :destroy
  has_many :allergens, through: :recipe_allergens
  has_many :recipe_medical_condition_exclusions, dependent: :destroy
  has_many :medical_condition_exclusions, through: :recipe_medical_condition_exclusions, source: :medical_condition

  validates :name, presence: true, uniqueness: true
end
