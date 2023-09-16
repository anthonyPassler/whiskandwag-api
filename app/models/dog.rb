# frozen_string_literal: true

class Dog < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :nullify
  has_many :reviews, through: :user
  has_many :recommended_recipes, dependent: :destroy
  has_many :dog_allergies, dependent: :destroy
  has_many :allergies, through: :dog_allergies, source: :allergen
end
