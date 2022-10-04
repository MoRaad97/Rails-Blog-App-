class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_create :update_counter

  def update_counter
    if !post.comment_counter
      post.comment_counter = 1
      post.save
    else
      post.comment_counter += 1
      post.save
    end
  end
end
