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
      flash[:error] = 'Error! User not found'
      redirect_to users_url
    end
  end
end
