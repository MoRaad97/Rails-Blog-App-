class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'
  after_create :update_counter

  def update_counter
    if !posts.comment_counter
      posts.comment_counter = 1
      posts.save
    else
      posts.comment_counter += 1
      posts.save
    end
  end
end
