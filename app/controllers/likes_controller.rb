class LikesController < ApplicationController 
  def create
    @like = Like.new()
    @post = Post.find(params[:post_id])
    @like.user_id = current_user.id
    @like.post_id = @post.id
    @like.save
  end
end

