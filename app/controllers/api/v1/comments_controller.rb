class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    comments = post.comments
    render json: comments
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: 404
  end

  def create
    @post = Post.find(params[:post_id])
    json_request = JSON.parse(request.body.read)
    text = json_request['text']
    author = @post.author

    @comment = @post.comments.new(text:, author:)
    if @comment.save
      render json: @comment
    else
      render json: { error: 'Invalid comment' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
