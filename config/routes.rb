Rails.application.routes.draw do
  resources :pseudos
  devise_for :users
  resources :users
  resources :comments
  resources :posts
  resources :messages
  resources :rooms
  root to: "rooms#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
