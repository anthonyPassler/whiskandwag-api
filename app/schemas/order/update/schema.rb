# frozen_string_literal: true

class Order
  module Update
    class Schema < BaseSchema
      json do
        optional(:total_price).filled(:decimal, gt?: 0, lt?: 100_000_000)
        optional(:fulfilled_at).filled(:date_time)
        optional(:dispatch_date).filled(:date_time)
        optional(:status).filled(:string, included_in?: ORDER_STATUSES)
      end
    end
  end
end
