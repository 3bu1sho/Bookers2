Rails.application.routes.draw do
  
  root :to => 'homes#top'
  get 'homes/about'
 ## get 'users/show'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :post_images
  end
