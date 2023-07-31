# frozen_string_literal: true

class Order
  module Create
    class Schema < ApplicationSchema
      json do
        required(:total_price).filled(:decimal, gt?: 0, lt?: 100_000_000)
        required(:portions).filled(:integer, gt?: 0, lt?: 100_000_000)
        required(:portion_weight_in_grams).filled(:integer, gt?: 0, lt?: 100_000_000)
        required(:frequency_in_weeks).filled(:integer, gt?: 0, lt?: 100_000_000)

        required(:relationships).hash do
          required(:user).schema(Generic::Relationships::Schema.new)
        end
      end
    end
  end
end
