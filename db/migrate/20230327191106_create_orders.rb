class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.decimal :total_price, precision: 10, scale: 2
      t.integer :portions
      t.integer :portion_weight_in_grams
      t.integer :frequency_in_weeks

      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
