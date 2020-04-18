Rails.application.routes.draw do
  root 'users#new'

  get '/signup', to: 'users#new'
  get '/login', to: 'login#new'
  get '/admin', to: 'admins#select_action'
  get '/admins', to: 'admins#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end
