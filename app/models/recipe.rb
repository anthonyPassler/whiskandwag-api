# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
