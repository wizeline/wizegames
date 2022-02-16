Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/sign_in', :to => 'sessions#new', :as => :new_session
  get '/logout', :to => 'sessions#destroy'
  # Defines the root path route ("/")
  root "home#index"
end