Rails.application.routes.draw do
  devise_for :users
  root 'places#home'
  get 'resources', to: 'places#resources'
  resources :places, only: [:index]
  resources :helpers
  resources :helpees
  resources :messages, only: [:index, :create]
  resources :conversations do
    resources :direct_messages
  end
end
