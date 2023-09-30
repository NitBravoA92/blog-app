class UsersController < ApplicationController
  before_action :find_user_by_id, only: [:show]
  def index
    @users = User.all
    @title = 'All users'
  end

  def show; end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Error! User not found'
    redirect_to users_url
  end
end
