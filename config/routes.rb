Rails.application.routes.draw do

  resources 'items', only: [:index]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#index'
  delete '/carts', to: 'carts#destroy'

  get '/:category_name', to: 'categories#show', as: 'category'
end