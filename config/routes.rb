Rails.application.routes.draw do

  root to: 'splash#home'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]

      get '/most_popular', to: 'items#most_popular'
    end
  end

  resources 'items', only: [:index, :show]
  post '/retired_item', to: 'items#reject', as: 'retired_item'

  resources :orders, only: [:index, :show, :create, :update]

  resources :carts, only: [:create]
  put    '/carts', to: 'carts#update'
  delete '/carts', to: 'carts#destroy'
  get    '/cart', to: 'carts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update] 
  
  get '/dashboard', to: 'users#show'

  namespace :admin do 
    get '/dashboard', to: 'base#dashboard'
    resources :items, only: [:index, :edit, :update]
  end

  get '/:category_name', to: 'categories#show', as: 'category'
end