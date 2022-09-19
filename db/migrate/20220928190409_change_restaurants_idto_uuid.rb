class ChangeRestaurantsIdtoUuid < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :restaurants do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE restaurants ADD PRIMARY KEY (id);"
  end
end
