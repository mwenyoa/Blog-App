# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.firs
first_user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create!(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# create 2 posts for each user
first_post = Post.create!(author: first_user, title: '1 Post',
                          text: 'This is my first post Justo sit dolor gubergren magna rebum amet gubergren')
second_post = Post.create!(author: first_user, title: '2 Post',
                           text: 'This is my second post asd sadipscing dolores lorem at rebum amet dolore ..')
third_post = Post.create!(author: second_user, title: '3 Post',
                          text: 'This is my third post asd sadipscing dolores lorem at rebum amet dolore consetetur ')
fourth_post = Post.create!(author: second_user, title: '4 Post',
                           text: 'This is my fourth post asd sadipscing dolores lorem at rebum amet dolore ')

# Create at least 3 posts comments each post
Comment.create!(post: first_post, author: second_user, text: 'Hi Tom! nice post')
Comment.create!(post: first_post, author: first_user, text: 'Hi Lilly! This is awesome')
Comment.create!(post: second_post, author: first_user, text: 'Hi Lilly! I can\'t see the share button')
Comment.create!(post: second_post, author: second_user, text: 'Hi Tom! when are you publishing the next one')
Comment.create!(post: third_post, author: first_user, text: 'Hi Lilly! this is so inspiring')
Comment.create!(post: third_post, author: second_user, text: 'Hi Tom! I like this')
Comment.create!(post: fourth_post, author: first_user, text: 'Hi Lilly! Amazing work')
Comment.create!(post: fourth_post, author: second_user, text: 'Hi Tom! I need more of such writings')
