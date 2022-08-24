# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Validations
  validates :author_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
