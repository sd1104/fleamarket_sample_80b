Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  
  resources :users, only: :index do
    get 'logout'
    get 'account_delete'
  end
  resources :profiles, only: [ :new, :create, :edit, :update]
  resources :product_addresses, only: [ :new, :create, :edit, :update ]
  resources :credits,only: [ :new, :show] do
    collection do
      post 'show', to: 'credit#show'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
    end
  end
  delete 'deleteData',to: 'credit#deleteData'
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  
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
