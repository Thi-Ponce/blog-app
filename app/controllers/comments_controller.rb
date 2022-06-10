class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:success] = 'Comment created!'
    else
      flash[:error] = 'Comment not created!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
