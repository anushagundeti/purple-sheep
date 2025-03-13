Rails.application.routes.draw do
  # defines RESTful routes for the Articles resource (index, show, create, update, destroy)
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
