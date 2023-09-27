class CommentsController < ApplicationController
  def new
    @post = find_post_by_id
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
  end

  private

  def find_post_by_id
    Post.find(params[:post_id])
  end
end
