class Api::V1::PostsController < ActionController::API
  # GET users/user_id/posts this endpoint will return all posts for a given user
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: 404
  end
end
