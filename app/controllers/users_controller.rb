class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(users_id: @user.id)
  end

  def index
    @users = User.all
  end
end
