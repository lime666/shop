Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show, :search] do
      get 'search', on: :collection
    end
      
  end

  resources :pages, only: [:home]

  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
