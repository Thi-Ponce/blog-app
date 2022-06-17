class Api::V1::CommentsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def create
    user = User.where(token: params[:token])[0]
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: params[:text], post_id: params[:post_id], author_id: user.id)
    if @comment.save
      render json: { message: 'Comment created!' }
    else
      render json: { error: 'Unable to create comment!' }
    end
  end
end
