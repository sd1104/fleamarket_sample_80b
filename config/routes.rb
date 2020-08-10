Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :users
  resources :profiles
  resources :product_addresses, only: [ :new, :create, :edit, :update ]
  resources :credits
  
  
  resources :items do
    resources :item_images
  end
  resources :categories, only: :index
end
