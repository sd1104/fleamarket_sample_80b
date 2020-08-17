Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  
  resources :users, only: :index do
    get 'logout'
    get 'account_delete'
    resources :credits,only: [ :new, :show, :create] do
      collection do
        post 'show', to: 'credits#show'
        post 'pay', to: 'credits#pay'
        post 'delete', to: 'credits#delete'
      end
    end
  end
  resources :profiles, only: [ :new, :create, :edit, :update]
  resources :product_addresses, only: [ :new, :create, :edit, :update ]
  
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
