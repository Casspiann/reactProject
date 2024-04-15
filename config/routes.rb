Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'categories/create'
      # Define all resources within a single resources block
      resources :posts, only: [:index, :show, :create]
      resources :products
      resources :categories
      resources :users, param: :_username
      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'

      # Define root route directly within the namespace block
      root to: 'posts#index'
    end
  end
end
