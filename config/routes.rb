Rails.application.routes.draw do
  devise_for :users
  # root 'items#index'
  root 'users#index'
  resources :users, only: :index
  resources :profiles
  resources :product_addresses
  resources :credits
  
  
  resources :items do
    resources :item_images
  end
  resources :categories, only: :index
end
