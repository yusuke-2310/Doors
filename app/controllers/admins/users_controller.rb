class Admins::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path
  end

end
