# frozen_string_literal: true

class AddAuthTokenToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :auth_token, :string
    add_index :events, :auth_token, unique: true
  end
end
