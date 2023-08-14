# frozen_string_literal: true

class Dog < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :nullify
  has_many :reviews, through: :user
end
