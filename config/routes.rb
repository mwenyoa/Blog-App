Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'comments/create'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  get 'likes/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
end
