Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :notes, only: [:index, :show, :new, :create, :update]
  resources :todos, only: [:index]
  resources :todos, only: [:update, :show, :new, :create], controller: 'notes', type: 'Note'
end
