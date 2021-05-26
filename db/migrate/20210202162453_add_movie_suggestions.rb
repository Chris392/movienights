# frozen_string_literal: true

class AddMovieSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_suggestions, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :event
    end
  end
end
