class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  # user validations
  validates :name, presence: true
  validates :posts_counter,  numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
