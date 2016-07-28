Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/twitter', as: :login
  
  get "auth/twitter/callback", to: "sessions#create"
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/search', to: 'searches#index'
end
