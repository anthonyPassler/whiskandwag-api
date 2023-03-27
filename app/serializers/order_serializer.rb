class OrderSerializer < ApplicationSerializer
  attribute(:total_price)
  attribute(:frequency_in_weeks)
  attribute(:portions)
  attribute(:portion_weight_in_grams)
end
