# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'start#dashboard'
  get 'game', to: 'match_maker#game'
  # Defines the root path route ("/")
  # root "articles#index"
end
