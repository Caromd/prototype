Rails.application.routes.draw do
  devise_for :users
  resources :owners
  scope :owner_assets do resources :assets end
  resources :renters
  resources :contracts
  resources :odometers
  root 'contracts#index'
end
