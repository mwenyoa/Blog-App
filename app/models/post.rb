class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  def update_user_posts
    author.increment!(:counter)
  end

  def get_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
