Rails.application.routes.draw do

  get 'cart_items/index'
  get 'cart_items/show'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items
  resources :carts
  resources :profiles
end
