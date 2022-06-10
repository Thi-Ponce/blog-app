class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
  end

  def show
    post_id = params[:id].to_i
    @post = Post.find(post_id)
  end
end
