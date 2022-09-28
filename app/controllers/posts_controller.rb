class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.recent_comments
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(users_id: @user.id)
  end
end
