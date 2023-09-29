Rails.application.routes.draw do
  # Adding nested resources routes for users and posts
  resources :users , only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      post 'addlike', on: :member
      delete 'deletelike', on: :member
      resources :comments, only: [:new, :create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
