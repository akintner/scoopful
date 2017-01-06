Rails.application.routes.draw do

  root to: 'items#index'

  resources 'items', only: [:index, :show]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#index'
  delete '/carts', to: 'carts#destroy'
  post '/retired_carts', to: 'carts#reject', as: 'retired_carts'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  get '/:category_name', to: 'categories#show', as: 'category'
end