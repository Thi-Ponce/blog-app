class Api::V1::CommentsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end
end