require "rails_helper"

RSpec.describe Post, :type => :model do
  it "validates a post cannot be created without an author" do
    post = Post.create(
      title: "My first post",
      content: "This is a test of my first post"
    )

    expect(Post.all.length).to eq(0)
    expect(post.valid?).to eq(false)
  end

  it "validates a post belongs to an author" do
    lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      city: "San Francisco",
      email: "lucy@gmail.com",
      password_digest: "1234",
      )
    post = Post.create(
      title: "My first post",
      content: "This is a test of my first post",
      user_id: lucy.id
    )

    expect(Post.all.length).to eq(1)
    expect(lucy.posts.length).to eq(1)
    expect(post.valid?).to eq(true)
  end

  it "validates a post cannot be created without content" do
    lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      city: "San Francisco",
      email: "lucy@gmail.com",
      password_digest: "1234",
      )
    post = Post.create(
      title: "My first post",
      user_id: lucy.id
    )

    expect(Post.all.length).to eq(0)
    expect(post.valid?).to eq(false)
  end

end
