# frozen_string_literal: true

class MovieSuggestion < ApplicationRecord
  acts_as_votable
  belongs_to :event
  belongs_to :movie
end
