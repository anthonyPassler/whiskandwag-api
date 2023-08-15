# frozen_string_literal: true

class Order
  class BaseSchema < ApplicationSchema
    ORDER_STATUSES = %w[active cancelled dispatched fulfilled].freeze
  end
end
