# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'
  get '/signup', to: 'users#new'
  root 'session#new'
end
