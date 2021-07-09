Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


end
