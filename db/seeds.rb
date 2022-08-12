# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.firs
User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

Post.create!(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create!(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create!(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create!(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create!(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create!(author_id: 2, title: 'Hello', text: 'This is my first post')

Comment.create(post_id: 1, author_id: 1, text: 'Hi Tom!')
Comment.create(post_id: 1, author_id: 1, text: 'Hi Tom!')
Comment.create(post_id: 1, author_id: 1, text: 'Lilly!')
Comment.create(post_id: 1, author_id: 1, text: 'Hi Tom!')
Comment.create(post_id: 1, author_id: 1, text: 'Lilly!')
Comment.create(post_id: 1, author_id: 1, text: 'Hi Tom!')
Comment.create(post_id: 2, author_id: 2, text: 'Lilly!')
Comment.create(post_id: 2, author_id: 2, text: 'Hi Tom!')
Comment.create(post_id: 2, author_id: 2, text: 'Lilly!')
