Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  resources :articles
  resources :users

   root to: 'homes#top'
end
