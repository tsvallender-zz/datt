Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :notes, only: [:index, :show, :new, :create]
  resources :todos, only: [:index, :update]
  resources :todos, only: [:show, :new, :create], controller: 'notes', type: 'Note'
end
