Rails.application.routes.draw do

  root                     'staticpage#home'
  get    '/help',      to: 'staticpage#help'
  get    '/about',     to: 'staticpage#about'
  get    '/contact',   to: 'staticpage#contact'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end