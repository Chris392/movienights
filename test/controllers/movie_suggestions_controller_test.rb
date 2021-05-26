# frozen_string_literal: true

require 'test_helper'

class MovieSuggestionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get upvote' do
    get movie_suggestions_upvote_url
    assert_response :success
  end

  test 'should get downvote' do
    get movie_suggestions_downvote_url
    assert_response :success
  end
end
