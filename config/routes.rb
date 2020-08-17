Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  
  resources :users, only: :index do
    get 'logout'
    get 'account_delete'
  end
  
  resources :credits,only: [ :new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end

  resources :profiles, only: [ :new, :create, :edit, :update]
  
  resources :product_addresses, only: [ :new, :create, :edit, :update ]
  
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
