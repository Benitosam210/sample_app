Rails.application.routes.draw do
  get 'sessions/new'
  root 'staticpage#home'
  get '/help',      to: 'staticpage#help'
  get '/about',     to: 'staticpage#about'
  get '/contact',   to: 'staticpage#contact'
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
