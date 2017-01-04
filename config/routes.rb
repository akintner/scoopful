Rails.application.routes.draw do

  resources 'items', only: [:index]

  get '/:category_name', to: "categories#show"

end
