class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :description
      t.decimal :rating
      t.string :image_url

      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
