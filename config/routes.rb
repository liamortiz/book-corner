Rails.application.routes.draw do
  get "/users/sign_in", to: "users#sign_in"

  get '/books', to: 'books#index'
  get '/books/:isbn', to: 'books#show'
  get '/books/?q=:q', to: 'books#index'

  resources :reviews
  resources :users


  root "static#index"

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
