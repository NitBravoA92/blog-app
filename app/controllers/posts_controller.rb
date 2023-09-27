class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! User not found'
    redirect_to users_url
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
  end

  def show
    @users_posts = User.find(params[:user_id]).posts
    @post = @users_posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! Post not found'
    redirect_to user_posts_url
  end
end
