Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users
  resources :profiles
  resources :product_addresses
  resources :credits
  
  
  resources :items do
    resources :item_images
    collection do
      get 'search'
    end
  end
  resources :categories, only: :index
end
