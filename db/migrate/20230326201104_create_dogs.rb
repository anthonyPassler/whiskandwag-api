class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs, id: :uuid do |t|
      t.string :name
      t.string :breed
      t.integer :weight
      t.integer :age
      t.string :gender
      t.string :fussiness_level
      t.string :health_issues, array: true, default: [], null: false
      t.string :activity_level
      t.string :allergies, array: true, default: [], null: false
      t.integer :kcal_per_day
      t.integer :food_portion_in_grams

      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
