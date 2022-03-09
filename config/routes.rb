Rails.application.routes.draw do
  get 'orders/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 
  
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  
  
  resources :products do
    resources :order_items, only: [:create, :update, :destroy]
  end

  resources :comments

  resources :orders, only: [:show, :update]

  resources :pages, only: [:home, :contacts, :all_products]
  get 'contacts', to: 'pages#contacts'
  get 'all_products', to: 'pages#all_products'

  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
