# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :events
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'
  get '/signup', to: 'users#new'
  get '/accept_invite', to: 'events#accept'
  root 'session#new'
end
