class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
  end

  def show
    post_id = params[:id].to_i
    @post = Post.find(post_id)
    @user = User.find(params[:user_id])
  end

  def new
    @current_user_id = current_user.id.to_i
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])

    @post = current_user.posts.new(params.permit(:title, :text))
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Post not created!'
      redirect_to "/users/#{@user.id}/posts"
    end
  end

  private

  def post_params
    params.permit(:title, :text)
  end
end