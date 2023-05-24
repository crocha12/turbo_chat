Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
  end
  resources :rooms
  resources :messages, only: [:create]
  root 'rooms#index'
end
