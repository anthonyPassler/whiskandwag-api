class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name
      t.integer :kcal_per_100g
      t.string :ingredients, array: true, default: [], null: false
      t.string :allergens, array: true, default: [], null: false
      t.decimal :fat_percentage
      t.string :fussiness_levels, array: true, default: [], null: false
      t.string :health_issues, array: true, default: [], null: false
      t.string :image_url
      t.boolean :is_selected, default: false, null: false
      t.decimal :price

      t.timestamps
    end
  end
end
