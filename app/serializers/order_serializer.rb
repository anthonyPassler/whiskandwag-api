# frozen_string_literal: true

class OrderSerializer < ApplicationSerializer
  attribute(:total_price)
  attribute(:fulfilled_at)
  attribute(:dispatch_date)
  attribute(:status)

  has_one(:user)
  has_one(:dog)
end
