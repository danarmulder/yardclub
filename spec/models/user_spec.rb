require "rails_helper"

RSpec.describe User, :type => :model do
  it "validates the user is not created without an email" do
    lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      city: "San Francisco",
      password_digest: "1234",
      )

    expect(User.all.length).to eq(0)
    expect(lucy.valid?).to eq(false)
  end

  it "validates the user is not created without a city" do
    lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      email: "lucy@gmail.com",
      password_digest: "1234",
      )

    expect(User.all.length).to eq(0)
    expect(lucy.valid?).to eq(false)
  end

  it "validates the user is not created without a unique email" do
    lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      email: "lucy@gmail.com",
      city: "San Francisco",
      password_digest: "1234",
      )
    other_lucy = User.create(
      first_name: "Lucy",
      last_name: "van Pelt",
      email: "lucy@gmail.com",
      city: "San Francisco",
      password_digest: "1234",
      )

    expect(User.all.length).to eq(1)
    expect(other_lucy.valid?).to eq(false)
  end
end
