# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items, id: :uuid do |t|
      t.references :order, type: :uuid, foreign_key: true
      t.references :recipe, type: :uuid, foreign_key: true
      t.integer :quantity
      t.integer :portion_weight_in_grams
      t.decimal :price

      t.timestamps
    end
  end
end
