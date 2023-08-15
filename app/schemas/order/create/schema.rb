# frozen_string_literal: true

class Order
  module Create
    class Schema < BaseSchema
      json do
        required(:total_price).filled(:decimal, gt?: 0, lt?: 100_000_000)
        optional(:fulfilled_at).filled(:date_time)
        optional(:dispatch_date).filled(:date_time)
        optional(:status).filled(:string, included_in?: ORDER_STATUSES)

        required(:relationships).hash do
          required(:user).schema(Generic::Relationships::Schema.new)
          required(:dog).schema(Generic::Relationships::Schema.new)
        end
      end
    end
  end
end
