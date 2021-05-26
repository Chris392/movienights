# frozen_string_literal: true

class Event < ApplicationRecord
  def to_param
    auth_token
  end

  has_secure_token :auth_token

  belongs_to :user
  has_and_belongs_to_many :users
  has_many :movie_suggestions
  has_many :movies, through: :movie_suggestions
end
