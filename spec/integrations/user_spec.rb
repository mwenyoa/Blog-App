require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before (:each) do
    @first_user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    second_user = User.create!(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Poland.')

    #  create  posts for each user
    Post.create!(author: @first_user, title: 'Post 1', text: 'This is my first post')
    Post.create!(author: @first_user, title: 'Post 2', text: 'This is my second post')
    Post.create!(author: @first_user, title: 'Post 3', text: 'This is my third post')
    Post.create!(author: @first_user, title: 'Post 4', text: 'This is my fourth')

    Post.create!(author: second_user, title: 'Post 1', text: 'This is my first post')
    Post.create!(author: second_user, title: 'Post 2', text: 'This is my second post')
  end

end
