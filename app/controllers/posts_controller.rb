class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.recent_comments
    @user = @post.user
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
  end

  def new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.comment_counter = 0
    @post.likes_counter = 0
    current_user.posts << @post
    redirect_to user_post_path(current_user, @post)
  end
end
