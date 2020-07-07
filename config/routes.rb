Rails.application.routes.draw do
  resources :books
  resources :reviews
  resources :users
  

  root "static#index"

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
