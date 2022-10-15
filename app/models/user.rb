class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'user_id'
  has_many :comments
  has_many :likes
  validates :name, presence: true, length: { minimum: 2, maximum: 55 }
  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
