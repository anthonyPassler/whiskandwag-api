# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :recipe_allergens, dependent: :destroy
  has_many :allergens, through: :recipe_allergens

  validates :name, presence: true, uniqueness: true
end
