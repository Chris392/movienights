# frozen_string_literal: true

# Controller handling up/downvotes of Moviesuggestions
class MovieSuggestionsController < ApplicationController
  def upvote
    @movie_suggestion = MovieSuggestion.find(params[:id])
    puts params[:id]
    @movie_suggestion.upvote_by current_user
    redirect_back fallback_location: events_url
  end

  def downvote
    @movie_suggestion = MovieSuggestion.find(params[:id])
    @movie_suggestion.downvote_by current_user
    redirect_back fallback_location: events_url
  end
end
