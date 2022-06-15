class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:success] = 'Comment created!'
    else
      flash[:error] = 'ERROR!'
    end
    redirect_to user_post_path(current_user, @post)
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to user_posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
