# frozen_string_literal: true

class ReviewSerializer < ApplicationSerializer
  attribute(:rating)
  attribute(:description)
  attribute(:image_url)
end
