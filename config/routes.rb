Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:create]
    end
  end

  post 'users/:user_id/posts', to: 'posts#create', as: 'posts'
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'likes'
  post 'users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comments'
   root "users#index"
end