require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
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

  context 'User show page' do
    before(:each) do
      visit user_path(@first_user.id)
    end
    it 'I should see the user username' do
      expect(page).to have_content('Tom')
    end
    it 'Should display user photo' do
      users = User.all.order(:id)
      pics = page.all('img')
      expect(pics[0][:src]).not_to be('')
      expect(pics.length).to eq users.length - 1
    end
    it 'I can see the user bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end
    it 'Should display 3 last posts of user' do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
    end
    it 'I should see a button that lets me view all of a user posts' do
      expect(page).to have_content('see all posts')
    end
    it 'Should display all user post' do
      click_link 'see all posts'
      expect(current_path).to eq(user_posts_path(@first_user.id))
    end
  end

  context 'User post index page' do
    before(:each) do
      visit user_posts_path(@first_user.id)
    end
    it 'Should display user photo' do
      users = User.all.order(:id)
      pics = page.all('img')
      expect(pics[0][:src]).not_to be('')
      expect(pics.length).to eq users.length - 1
    end
    it 'Should display user name' do
      expect(page).to have_content('Tom')
    end
    it 'Should display user s posts count ' do
      expect(page).to have_content('Number of posts: 4')
    end
    it 'Should display post title' do
      expect(page).to have_content('Post 1')
    end
    it "I can see some of the post's body" do
      expect(page).to have_content('This is my first post')
    end
    it 'should display post s likes counter' do
      expect(page).to have_content('Likes 0')
    end
    it 'Should redirect to post s page' do
      click_link 'Post 1'
      expect(current_path).to eq(user_post_path(@first_user.id, @first_user.posts.first.id))
    end
  end

  context 'User post show page' do
    it 'Should display post text' do
      visit user_posts_path(@first_user.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should display comments counter' do
      visit user_post_path(@first_user.id, @first_user.posts.first.id)
      expect(page).to have_content('Comments 0')
    end

    it 'Should display first comment' do
      @first_user.comments.create(post_id: @first_user.posts.first.id, text: 'Comment1')
      visit user_posts_path(@first_user.id)
      expect(page).to have_content('Comments 1')
    end

    it 'Should redirect to post s page' do
      visit user_posts_path(@first_user.id)
      click_link 'Post 1'
      expect(current_path).to eq(user_post_path(@first_user.id, @first_user.posts.first.id))
    end
  end
end
