Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  resources :helpers, only: [:index, :new, :create, :show]
end
