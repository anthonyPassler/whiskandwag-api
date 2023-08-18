# frozen_string_literal: true

class Allergen < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
