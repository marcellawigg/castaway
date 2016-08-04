Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/twitter', as: :login
  get "auth/twitter/callback", to: "sessions#create"
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/shows/search', to: 'shows#index'
  get '/cart', to: 'cart#show'
  patch '/cart', to: 'cart#update'
  resources :cart, only: [:create, :destroy]
  resources :charges, only: [:new, :create]
  resources :ads, only: [:new, :create]
  resources :shows, only: [:show]
  resources :trending, only: [:index], as: :trending
end
