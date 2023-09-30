class PostsController < ApplicationController
  before_action :find_user_by_id, only: [:index, :show]
  before_action :find_post_by_id, only: [:addlike, :deletelike]

  def index
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
    new_post = current_user.posts.new(post_params)
    result = new_post.save
    render new unless result
    flash[:success] = 'The Post was created successfully!'
    redirect_to user_posts_path(current_user)
  end

  def show
    @users_posts = @user.posts
    @post = @users_posts.find(params[:id])
    @is_liked = like_exists?(@post, current_user)
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! Post not found'
    redirect_to user_posts_path
  end

  def addlike
    Like.create(post: @post, author: current_user) unless like_exists?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  def deletelike
    @post.likes.destroy_by(author: current_user) if like_exists?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
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

  def like_exists?(post, user)
    @like = post.likes.where(author: user)
    @like.exists?
  end
end
