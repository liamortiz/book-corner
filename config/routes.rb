Rails.application.routes.draw do
  get "/users/sign_in", to: "users#sign_in"

  get '/books/search', to: 'books#search', as: 'search'
  get '/books/:isbn', to: 'books#show', as: 'book'
  get '/books/?q=:q&page=:page', to: 'books#index'
  get '/books', to: 'books#index'
  # get "/users/register", to: "users#register"


  resources :reviews, only: [:create, :destroy]
  resources :users, only: [:create, :show]
  resources :user_shelves, only: [:create, :destroy]


  root "static#index"

end
