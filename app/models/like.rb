# frozen_string_literal: true

# :nodoc:
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
