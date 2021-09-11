Rails.application.routes.draw do
  get 'staticpage/home'
  get 'staticpage/help'
  get 'staticpage/about'
  root 'staticpage#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
