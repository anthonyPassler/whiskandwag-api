# frozen_string_literal: true

class UpdateReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :recipe, type: :uuid, foreign_key: true
  end
end
