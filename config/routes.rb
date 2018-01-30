Rails.application.routes.draw do
  root 'places#index'
  resources :helpers, only: [:new, :create, :show]
end
