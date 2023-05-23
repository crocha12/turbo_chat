Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
  end
  resources :rooms
  root 'rooms#index'
end
