class PostsController < ApplicationController
  def show
  end

  def index
    @posts = Post.all
  end
end
