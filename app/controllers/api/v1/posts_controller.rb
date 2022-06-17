class Api::V1::PostsController < ApplicationController
  include TokenAuthorization
  def index
    token = params[:token]
    credential = JsonWebToken::EncoderJWT.jwt_decode(token)
    user = User.where(email:token)
    if user == nil
     render json: {error: 'Unauthorized'}
    else
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
    render json: @posts
    end
  end
end
  