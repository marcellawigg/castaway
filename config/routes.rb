Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/twitter', as: :login

  get "auth/twitter/callback", to: "sessions#create"
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/shows/search', to: 'shows#index'
  get "/cart", to: "cart#show"
  resources :orders, only: [:index, :show, :create]
  resources :cart, only: [:create, :destroy, :update]

  resources :shows, only: [:show]
  resources :trending, only: [:index], as: :trending
end
