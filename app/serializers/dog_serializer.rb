class DogSerializer < ApplicationSerializer
  attribute(:name)
  attribute(:breed)
  attribute(:weight)
  attribute(:age)
  attribute(:gender)
  attribute(:fussiness_level)
  attribute(:health_issues)
  attribute(:activity_level)
  attribute(:allergies)
  attribute(:kcal_per_day)
  attribute(:food_portion_in_grams)

  has_one(:user)
end
