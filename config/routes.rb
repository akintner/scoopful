Rails.application.routes.draw do

  root to: 'items#index'

  resources 'items', only: [:index, :show]
  post '/retired_item', to: 'items#reject', as: 'retired_item'

  resources 'orders', only: [:index, :show]

  resources :carts, only: [:create]
  put    '/carts', to: 'carts#update'
  delete '/carts', to: 'carts#destroy'
  get    '/cart', to: 'carts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  namespace :admin do 
    get '/dashboard', to: 'base#dashboard'
  end

  get '/:category_name', to: 'categories#show', as: 'category'
end