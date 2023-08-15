# frozen_string_literal: true

class UpdateFulfilledToFulfilledAtOnOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :fulfilled
    add_column :orders, :fulfilled_at, :datetime
    change_column :orders, :dispatch_date, :datetime
  end
end
