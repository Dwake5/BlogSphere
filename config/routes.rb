Rails.application.routes.draw do
  get 'home/index'
  get 'sessions/new'
  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions

  get '/', to: 'homes#index'
  get 'users/:id/details' , to: 'users#details'
  get 'authors', to: 'users#index'
  get 'users/:id/details' , to: 'users#details'
  get 'authors/:id', to: 'users#show'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: "homes#index"

end
