Rails.application.routes.draw do
  # Adding nested resources routes for users and posts
  resources :users , only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show]
  end 

  # Defines the root path route ("/")
  # root "articles#index"
end
