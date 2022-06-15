class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
  end

  def show
    post_id = params[:id].to_i
    @post = Post.find(post_id)
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])

    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Post not created!'
      redirect_to "/users/#{@user.id}/posts"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post destroyed!'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
