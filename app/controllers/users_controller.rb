class UsersController < ApplicationController
  def index
    @users = User.all
    @title = 'All users'
  end

  def show
    @user_id = params[:id]
    begin
      @user = User.find(@user_id)
    rescue ActiveRecord::RecordNotFound
      redirect_to users_url, notice: 'User not found'
    end
  end
end
