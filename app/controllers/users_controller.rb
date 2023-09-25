class UsersController < ApplicationController
  def index
    @users = "All users"
  end

  def show
    @user_id = params[:id]
  end
end
