Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments do
    resources :comments, only: [:create, :destroy]
  end
  # Defines the root path route ("/")
 root "posts#index"
end
