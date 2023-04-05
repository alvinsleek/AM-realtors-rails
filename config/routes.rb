Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :properties
  # resources :clients
  # resources :payments

  get '/properties', to: 'properties#index'
  get '/properties/:id', to: 'properties#show'
  get '/properties/available', to: 'properties#available'
  post '/properties', to: 'properties#create'
  put '/properties/:id', to: 'properties#update'
  delete 'properties/:id', to: 'properties#destroy'
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create'
  put '/clients/:id', to: 'clients#update'
  delete 'clients/:id', to: 'clients#destroy'
  get '/payments', to: 'payments#index'
  get '/payments/:id', to: 'payments#show'
  post '/payments', to: 'payments#create'
  put '/payments/:id', to: 'payments#update'
  delete 'payments/:id', to: 'payments#destroy'
  post 

namespace :admin do
  # root to: 'admin#index'
  resources :properties
  resources :clients
  resources :payments
end

namespace :api do
  resources :properties
  resources :clients
  resources :payments
end
end

