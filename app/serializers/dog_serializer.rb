# frozen_string_literal: true

class DogSerializer < ApplicationSerializer
  attribute(:name)
  attribute(:breed)
  attribute(:weight)
  attribute(:age_in_months)
  attribute(:gender)
  attribute(:fussiness_level)
  attribute(:activity_level)
  attribute(:recommended_daily_calories)
  attribute(:food_portion_in_grams)
  attribute(:sterialized)

  has_one(:user)
end
