Rails.application.routes.draw do
  root 'homepage#index'
  get 'users/new', to: 'users#new'
  get 'users/:username', to: 'users#show', as: 'profile'
  get 'login', to: 'sessions#new'
  post 'opinion', to: 'opinions#create'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'likes/:opinion_id', to: 'likes#create', as: 'likes'
  delete 'like', to: 'likes#destroy'
  post 'follow/:user_id', to: 'followings#create', as: 'follow'
  delete 'unfollow/:user_id', to: 'followings#destroy', as: 'unfollow'

  resources :users, only: %i[new create edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
