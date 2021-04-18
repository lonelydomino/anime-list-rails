Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'pages#home'
get '/about', to: 'pages#about'
get 'signup', to: 'users#new'
post 'signup', to:'users#create'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get '/search', to: 'searches#index'
get '/results', to: 'searches#results'

resources :users, only: [:show] do 
  resources :lists
end

resources :users
resources :searches, only: [:index, :show]
resources :shows, only: [:show, :destroy]
get '/show/add', to: 'shows#add'
end
