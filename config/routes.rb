Rails.application.routes.draw do
  devise_for :users
  # root 'items#index'
  root 'product_addresses#index'
  
  resources :users
  resources :profiles
  resources :product_addresses, only: [ :index, :new, :create ]
  resources :credits
  
  
  resources :items do
    resources :item_images
  end
  resources :categories, only: :index
end
