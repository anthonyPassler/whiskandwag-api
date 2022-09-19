class DropRestaurantsTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :restaurants, :user, null: false, foreign_key: true, type: :uuid
    drop_table :restaurants
  end
end
