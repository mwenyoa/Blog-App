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

  context 'User index page' do
    it 'I should see the username of all other users' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'I should see the profile picture for each user' do
      visit users_path
      users = User.all.order(:id)
      pics = page.all('img')
      expect(pics[0][:src]).not_to be('')
      expect(pics.length).to eq users.length
    end

    it 'I should see the number of posts each user has written' do
      visit users_path
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Number of posts: 2')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit users_path
      click_link 'Tom'
      expect(current_path).to eq(user_path(User.first))
    end
  end
end
