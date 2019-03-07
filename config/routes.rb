Rails.application.routes.draw do


  devise_for :users
  root "items#index"
  resources :items
  resources :carts
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  resources :cart_items
  resources :charges, only: [:new, :create]
  
  namespace :admin do
  	resources :items, only: [:new, :create, :edit, :update, :delete]
  	root 'admin#index'
  end

end
