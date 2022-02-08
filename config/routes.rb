Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show, :search] do
      get 'search', to: 'products#search'

    end
      
  end

  resources :pages, only: [:home, :contacts, :all_products]
  get 'contacts', to: 'pages#contacts'
  get 'all_products', to: 'pages#all_products'

  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
