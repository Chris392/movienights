# frozen_string_literal: true

class AddEventUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :users do |t|
      t.index :event_id
      t.index :user_id
    end
  end
end
