class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  rescue ActiveRecord::RecordNotFound
    redirect_to users_url, notice: 'User not found'
  end

  def show
    @users_posts = User.find(params[:user_id]).posts
    @post = @users_posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to user_posts_url, notice: 'Post not found'
  end
end
