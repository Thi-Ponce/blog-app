class Api::V1::PostsController < ApplicationController

  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
    render json: @posts
  end
end
  