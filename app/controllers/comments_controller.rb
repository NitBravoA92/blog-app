class CommentsController < ApplicationController
  def new
    @post = find_post_by_id
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post_by_id
    Post.find(params[:post_id])
  end
end
