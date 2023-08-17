# frozen_string_literal: true

class AddSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.integer :fulfillment_frequency_in_weeks
      t.string :status
      t.string :cancellation_reason
      t.datetime :cancelled_at
      t.datetime :paused_at
      t.datetime :paused_until

      t.timestamps
    end

    add_reference :subscriptions, :user, type: :uuid, foreign_key: true
  end
end
