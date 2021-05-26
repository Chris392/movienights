# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_suggestions
  has_many :events, through: :movie_suggestions
end
