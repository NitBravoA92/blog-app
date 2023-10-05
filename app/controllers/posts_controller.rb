class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create addlike deletelike destroy]
  before_action :find_user_by_id, only: %i[index show]
  before_action :find_post_by_id, only: %i[addlike deletelike destroy]

  def index
    @posts = @user.posts.includes(:comments)
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! User not found'
    redirect_to users_url
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    result = new_post.save
    render new unless result
    flash[:success] = 'The Post was created successfully!'
    redirect_to user_posts_path(current_user)
  end

  def show
    @users_posts = @user.posts
    @post = @users_posts.find(params[:id])
    @is_liked = liked?(@post, current_user)
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! Post not found'
    redirect_to user_posts_path
  end

  def addlike
    Like.create(post: @post, author: current_user) unless liked?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  def deletelike
    @post.likes.destroy_by(author: current_user) if liked?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  def destroy
    authorize! :delete, @post
    if @post.destroy
      flash[:success] = 'The Post was deleted successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Error! The Post was not deleted'
      redirect_to user_post_path(current_user, @post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_user_by_id
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! User not found'
    redirect_to users_url
  end

  def find_post_by_id
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! Post not found'
    redirect_to user_posts_path
  end

  def liked?(post, user)
    @like = post.likes.where(author: user)
    @like.exists?
  end
end
