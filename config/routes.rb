# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'places#index'

  resources :places
end
