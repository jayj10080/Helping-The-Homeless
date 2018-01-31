Rails.application.routes.draw do
  devise_for :users
  root 'places#home'
  get 'resources', to: 'places#resources'
  resources :places, only: [:index]
  resources :helpers, only: [:index, :new, :create, :show]
  resources :helpees, only: [:index, :new, :create, :show]
end
