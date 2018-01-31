Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  get 'home', to: 'places#home'
  get 'resources', to: 'places#resources'
  resources :helpers, only: [:index, :new, :create, :show]
  resources :helpees, only: [:index, :new, :create, :show]
end
