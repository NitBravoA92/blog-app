Rails.application.routes.draw do
  # Adding nested resources routes for users and posts
  resources :users do
    resources :posts
  end 

  # Defines the root path route ("/")
  # root "articles#index"
end
