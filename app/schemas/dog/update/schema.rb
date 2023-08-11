# frozen_string_literal: true

class Dog
  module Update
    class Schema < BaseSchema
      json do
        optional(:name).filled(:string)
        optional(:breed).maybe(:string)
        optional(:weight).filled(:integer, lt?: 1000)
        optional(:age_in_months).filled(:integer, lt?: 1000)
        optional(:gender).filled(:string, included_in?: DOG_GENDERS)
        optional(:fussiness_level).filled(:string, included_in?: FUSSINESS_LEVELS)
        optional(:activity_level).filled(:string, included_in?: ACTIVITY_LEVELS)
        optional(:recommended_daily_calories).filled(:integer, lt?: 100_000)
        optional(:food_portion_in_grams).filled(:integer, lt?: 100_000)
        optional(:sterilized).filled(:bool)

        optional(:relationships).maybe(:hash) do
          required(:user).schema(Generic::Relationships::Schema.new)
        end
      end
    end
  end
end
