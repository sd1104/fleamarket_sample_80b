Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resouces :users
  resouces :profiles
  resouces :product_addresses
  resouces :credits
  resouces :items do
    collection :categories
  end
  resouces :item_images
end
