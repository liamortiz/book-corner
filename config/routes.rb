Rails.application.routes.draw do
  get "/users/sign_in", to: "users#sign_in", as: 'sign_in'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'

  get '/books/search', to: 'books#search', as: 'search'
  get '/books/:isbn', to: 'books#show', as: 'book'
  get '/books/?q=:q&page=:page', to: 'books#index'
  get '/books', to: 'books#index'
  

  resources :reviews, only: [:create, :destroy]
  resources :users, only: [:create, :show]
  resources :user_shelves, only: [:create, :destroy]
  


  root "static#index"

end
