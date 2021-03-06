Rails.application.routes.draw do

  # Routing Nested Resources
  resources :wish_lists do 
    resources :wishes, only: [:new, :create, :index, :show]
  end 
  resources :wishes, only: [:show, :index, :update, :destroy]


  resources :users
  resources :wish_lists


  post '/login', to: "sessions#login"
  # post '/auth', to: "sessions#login"
  post '/autologin', to: "sessions#autologin"

end
