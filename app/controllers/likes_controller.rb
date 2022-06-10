class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      flash[:success] = 'Liked!'
    else
      flash[:error] = 'ERROR! Not liked!'
    end
    redirect_to user_post_path(current_user, @post)
  end
end
