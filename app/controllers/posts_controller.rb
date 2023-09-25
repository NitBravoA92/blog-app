class PostsController < ApplicationController
  def index
    begin
      @user_id = params[:user_id]
      @posts = User.find(@user_id).posts
      @user_name = "William Brown"
    rescue ActiveRecord::RecordNotFound => e
      redirect_to users_url, notice: "User not found"
    end
  end

  def show
    begin
      @user_id = params[:user_id]
      @post_id = params[:id]
      @users_posts = User.find(@user_id).posts
      @post = @users_posts.find(@post_id)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to user_posts_url, notice: "Post not found"
    end
  end
end
