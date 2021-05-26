# frozen_string_literal: true

class AddEventsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.string :adress
      t.date :date
      t.string :time
    end
  end
end
