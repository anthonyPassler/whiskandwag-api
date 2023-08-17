# frozen_string_literal: true

class AddSubscriptionsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :subscription, type: :uuid, foreign_key: true
  end
end
