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
end
