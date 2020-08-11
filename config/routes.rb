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
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :categories, only: :index
end
