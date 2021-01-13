Rails.application.routes.draw do

  #Routing Nested Resources
  resources :wish_lists do 
    resources :wish, only: [:new, :create, :index, :show]
  end 
  resources :wishes, only: [:show, :index, :update]

  resources :users

  post '/login', to: "sessions#login"
  # post 'auth', to: "sessions#login"
  post 'autologin', to: "sessions#autologin"

end
