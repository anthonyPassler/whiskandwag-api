# frozen_string_literal: true

class UpdateOrdersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.remove :portions
      t.remove :portion_weight_in_grams
    end

    add_reference :orders, :dog, type: :uuid, foreign_key: true
  end
end
