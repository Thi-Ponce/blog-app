class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @like = Like.create(author_id: current_user.id, post_id: @post.id)

     if @post.liked?(current_user)
      flash[:success] = 'Liked!'
     else
      flash[:error] = 'ERROR!'
    end
   redirect_back_or_to(@post)
  end
end
