class Post < ApplicationRecord
  has_many :likes
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :users, class_name: 'User'
  after_create :update_counter
  validates :title, presence: true, length: { minimum: 2, maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
