Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
  end
  resources :rooms
  resources :messages, only: [:create]
  root 'rooms#index'
  get '/rooms/:id/list_users', to: 'rooms#list_users', as: 'list_users'
  put '/rooms/:id/toggle_participant/:user_id', to: 'rooms#toggle_participant', as: 'toggle_participant'
end
