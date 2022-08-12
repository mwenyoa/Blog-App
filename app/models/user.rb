class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
