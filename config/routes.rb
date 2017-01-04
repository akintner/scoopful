Rails.application.routes.draw do
  
  get '/:category_name', to: "categories#show"

end
