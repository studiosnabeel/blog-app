Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]

  end
end
