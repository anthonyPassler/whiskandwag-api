# frozen_string_literal: true

class Order
  module Update
    class Schema < ApplicationSchema
      json do
        optional(:total_price).filled(:decimal, gt?: 0, lt?: 100_000_000)
        optional(:portions).filled(:integer, gt?: 0, lt?: 100_000_000)
        optional(:portion_weight_in_grams).filled(:integer, gt?: 0, lt?: 100_000_000)
        optional(:frequency_in_weeks).filled(:integer, gt?: 0, lt?: 100_000_000)
      end
    end
  end
end
