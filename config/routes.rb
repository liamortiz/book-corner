Rails.application.routes.draw do
  get "/users/sign_in", to: "users#sign_in"

  get '/books/search', to: 'books#search', as: 'search'
  get '/books/:isbn', to: 'books#show'
  get '/books/?q=:q', to: 'books#index'
  get '/books', to: 'books#index'

  resources :reviews
  resources :users

  root "static#index"

end
