Rails.application.routes.draw do
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
end
