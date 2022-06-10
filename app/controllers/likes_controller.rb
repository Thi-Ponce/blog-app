class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

     if @like.save
      flash[:success] = 'Liked!'
     else
      flash[:error] = 'ERROR!'
    end
   redirect_back_or_to(@post)
  end
end
