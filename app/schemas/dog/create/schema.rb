# frozen_string_literal: true

class Dog
  module Create
    class Schema < BaseSchema
      json do
        required(:name).filled(:string)
        optional(:breed).maybe(:string)
        optional(:weight).filled(:integer, lt?: 1000)
        optional(:age).filled(:integer, lt?: 1000)
        optional(:gender).filled(:string, included_in?: DOG_GENDERS)
        optional(:fussiness_level).filled(:string, included_in?: FUSSINESS_LEVELS)
        optional(:health_issues).filled(:array).each(:string)
        optional(:activity_level).filled(:string, included_in?: ACTIVITY_LEVELS)
        optional(:allergies).filled(:array).each(:string)
        optional(:kcal_per_day).filled(:integer, lt?: 100_000)
        optional(:food_portion_in_grams).filled(:integer, lt?: 100_000)

        optional(:relationships).maybe(:hash) do
          required(:user).schema(Generic::Relationships::Schema.new)
        end
      end
    end
  end
end
