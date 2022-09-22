class Like < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'
  after_create :update_counter

  def update_counter
    if !posts.likes_counter
      posts.likes_counter = 1
      posts.save
    else
      posts.likes_counter += 1
      posts.save
    end
  end
end
