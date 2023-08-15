# frozen_string_literal: true

class UpdateOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :frequency_in_weeks
    add_column :orders, :fulfilled, :boolean, default: false
    add_column :orders, :dispatch_date, :date
    add_column :orders, :status, :string
  end
end
