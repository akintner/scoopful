Rails.application.routes.draw do

  root to: 'items#index'

  resources 'items', only: [:index, :show]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#index'
  delete '/carts', to: 'carts#destroy'

  get '/:category_name', to: 'categories#show', as: 'category'
end