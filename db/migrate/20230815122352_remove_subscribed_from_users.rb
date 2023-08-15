# frozen_string_literal: true

class RemoveSubscribedFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :subscribed
  end
end
