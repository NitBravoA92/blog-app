class CommentsController < ApplicationController
  def new
    @post = find_post_by_id
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
    @post = find_post_by_id
    @new_comment = @post.comments.new(comment_params)
    @new_comment.author = current_user
    result = @new_comment.save
    render new unless result
    flash[:success] = 'The comment of the post was created successfully!'
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post_by_id
    Post.find(params[:post_id])
  end
end
