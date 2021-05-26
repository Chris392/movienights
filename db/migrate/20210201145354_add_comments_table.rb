# frozen_string_literal: true

class AddCommentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
    end
  end
end
