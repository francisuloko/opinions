Rails.application.routes.draw do
  get 'homepage/index'
  root 'users#index'
  get 'users', to: 'users#index'
  get 'users/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
