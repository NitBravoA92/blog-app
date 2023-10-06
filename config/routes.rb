Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-documentation'
  mount Rswag::Api::Engine => '/api-documentation'
  devise_for :users
  # Adding nested resources routes for users and posts
  resources :users , only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      post 'addlike', on: :member
      delete 'deletelike', on: :member
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  # Defines the root path route ("/")
  root "users#index"

  # API endpoints
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end
