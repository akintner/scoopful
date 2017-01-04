Rails.application.routes.draw do

  resources 'items', only: [:index]
  
  resources :carts, only: [:create]
  get '/cart', to: 'carts#index'

  get '/:category_name', to: 'categories#show', as: 'category'


end
