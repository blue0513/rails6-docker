Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'login#new'
  get '/admin', to: 'admins#select_action'
  get '/admins', to: 'admins#index'
  resources :users
end
