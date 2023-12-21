# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  resources :targets
  root "dashboard#index"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/sessions", to: "sessions#index", as: :sessions
end
