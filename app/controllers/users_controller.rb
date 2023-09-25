class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "All users"
  end

  def show
    @user_id = params[:id]
    begin
      @user = User.find(@user_id)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to users_path, notice: "User not found"
    end
  end
end
