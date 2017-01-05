Rails.application.routes.draw do

  root to: 'items#index'

  resources 'items', only: [:index]

  resources :carts, only: [:create]
  put    '/carts', to: 'carts#update'
  delete '/carts', to: 'carts#destroy'

  get    '/cart', to: 'carts#index'

  get '/:category_name', to: 'categories#show', as: 'category'
end