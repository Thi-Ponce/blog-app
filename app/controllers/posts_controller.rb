class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
  end

  def show
    post_id = params[:id].to_i
    @post = Post.find(post_id)
    @user = User.find(params[:id].to_i)
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
