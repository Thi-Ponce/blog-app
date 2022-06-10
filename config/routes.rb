Rails.application.routes.draw do

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  post 'users/:user_id/posts', to: 'posts#create', as: 'posts'
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'likes'

   root "users#index"
end