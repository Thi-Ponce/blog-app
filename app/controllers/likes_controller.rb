class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    return if @post.liked?(current_user)

    @like = @post.likes.new
    @like.author = current_user

     if @like.save
      flash[:success] = 'Liked!'
     else
      flash[:error] = 'ERROR!'
    end
   redirect_back_or_to(@post)
  end
end
