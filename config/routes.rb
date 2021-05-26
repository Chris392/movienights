# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  resources :events do
    get :details, on: :member
    get :chat, on: :member
    get :organisation, on: :member
    get :addmovie, on: :member
    get :login_success, on: :member
    get :invite, on: :member
  end

  resources :movie_suggestions do
    member do
      put 'upvote', to: 'movie_suggestions#upvote'
      put 'downvote', to: 'movie_suggestions#downvote'
    end
  end

  root to: 'events#index'
end
