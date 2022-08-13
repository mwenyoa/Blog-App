class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  def update_user_posts
    author.increment!(:counter)
  end

  # Post validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter,
            numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
