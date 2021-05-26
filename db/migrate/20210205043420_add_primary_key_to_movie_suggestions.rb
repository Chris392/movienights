# frozen_string_literal: true

class AddPrimaryKeyToMovieSuggestions < ActiveRecord::Migration[6.1]
  def change
    add_column :movie_suggestions, :id, :primary_key
  end
end
