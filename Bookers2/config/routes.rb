Rails.application.routes.draw do
  
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as: 'homes_about'
 ## get 'users/show'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :post_images
  end
