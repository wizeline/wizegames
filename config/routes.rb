Rails.application.routes.draw do
  root "home#index"

  resources :games
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Defines the root path route ("/")
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/sign_in', :to => 'sessions#new', :as => :new_session
  get '/logout', :to => 'sessions#destroy'

  resources :cats do
    resources :moves, only: [:create]
  end

  resources :four_lines do
    resources :moves, only: [:create]
  end
end
