# frozen_string_literal: true

class AddMovieTable < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :actors
      t.text   :plot
      t.string :rating
      t.text :poster_url
      t.string :trailor_url
    end
  end
end
