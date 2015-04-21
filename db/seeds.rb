# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
lucy = User.create(
  first_name: "Lucy",
  last_name: "van Pelt",
  email: "lucy@gmail.com",
  city: "San Francisco",
  password_digest: "1234",
  )
dana = User.create(
  first_name: "Dana",
  last_name: "Mulder",
  email: "danarmulder2@gmail.com",
  city: "San Francisco",
  password_digest: "1234",
  )
lucy_post = Post.create(
  title: "Lucy's first post",
  content: "Oh brother, Charlie Brown",
  user_id: lucy.id
)
dana_post = Post.create(
  title: "Dana's first post",
  content: "Test post",
  user_id: dana.id
)
dana_comment = Comment.create(
  content: "Who is Charlie Brown?",
  author: dana.id,
  post_id: lucy_post.id,
)
lucy_comment = Comment.create(
  content: "Charlie Brown!! Everyone knows Charlie Brown!!",
  author: lucy.id,
  post_id: lucy_post.id,
  parent_id: dana_comment.id
)
dana_return_comment = Comment.create(
  content: "The cartoon?",
  author: dana.id,
  post_id: lucy_post.id,
  parent_id: lucy_comment.id
)
