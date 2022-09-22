class Post < ApplicationRecord
  has_many :likes
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :users, class_name: 'User'
  after_create :update_counter

  def update_counter
    if !users.posts_counter
      users.posts_counter = 1
      users.save
    else
      users.posts_counter += 1
      users.save
    end
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
