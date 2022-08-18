class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy, class_name: 'Like'
  has_many :comments, dependent: :destroy, class_name: 'Comment'

  after_save :update_user_posts

  def update_user_posts
    author.increment!(:posts_counter)
  end

  # Post validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter,
            numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
