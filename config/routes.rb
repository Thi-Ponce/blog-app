Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end

  post 'users/:user_id/posts', to: 'posts#create', as: 'posts'
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'likes'
  post 'users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comments'
  delete 'users/:user_id/posts/:post_id/comments', to: 'comments#destroy', as: 'comments_destroy'
end