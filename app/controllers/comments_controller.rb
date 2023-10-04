class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_post_by_id, only: %i[new create]

  def new
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
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
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! Post not found'
    redirect_to user_posts_path
  end
end
