Rails.application.routes.draw do
  devise_for :users
  resources :owners
  scope :owner_assets do resources :assets end
  resources :renters
  resources :contracts
  resources :odometers
  resources :invoices
  resources :lines
  resources :line_types
  resources :makes
  resources :models
  root 'contracts#index'
end
