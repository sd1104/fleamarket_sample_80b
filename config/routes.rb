Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles',              to: 'users/registrations#new_profile'
    post 'profiles',             to: 'users/registrations#create_profile'
    get 'product_addresses',     to: 'users/registrations#new_product_address'
    post 'product_addresses',    to: 'users/registrations#create_product_address'
    get 'registration_finished', to: 'users/registrations#registration_finished'
  end

  root 'items#index'
  
  resources :users, only: :index do
    get 'logout'
    get 'account_delete'
  end
  resources :profiles, only: [ :new, :create, :edit, :update]
  resources :product_addresses, only: [ :new, :create, :edit, :update ]
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
