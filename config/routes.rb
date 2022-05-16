# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

  resources :products do
    resources :order_items, only: %i[create update destroy]
  end

  resources :comments

  resources :orders, only: %i[show update]

  resources :pages, only: %i[home contacts all_products]
  get 'contacts', to: 'pages#contacts'
  get 'all_products', to: 'pages#all_products'

  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
