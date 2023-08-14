# frozen_string_literal: true

class OrderSerializer < ApplicationSerializer
  attribute(:total_price)
  attribute(:frequency_in_weeks)

  has_one(:user)
  has_one(:dog)
end
