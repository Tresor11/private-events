Rails.application.routes.draw do
  resources :users
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  root 'session#new'
end
