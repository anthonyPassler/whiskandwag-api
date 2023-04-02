# frozen_string_literal: true

class Dog
  module Create
    class Schema < ApplicationSchema
      json do
        required(:name).filled(:string)
        optional(:breed).filled(:string)
        optional(:weight).filled(:integer)
        optional(:age).filled(:integer)
        optional(:gender).filled(:string)
        optional(:fussiness_level).filled(:string)
        optional(:health_issues).filled(:array).each(:string)
        optional(:activity_level).filled(:string)
        optional(:allergies).filled(:array).each(:string)
        optional(:kcal_per_day).filled(:integer)
        optional(:food_portion_in_grams).filled(:integer)
      end
    end
  end
end
