# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      email: "test@example.com",
      password: "password123",
      name: "Test User"
    )
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(
      email: "test@example.com",
      password: "password123"
    )
    expect(user).to_not be_valid
  end

  it "is not valid without a valid email" do
    user = User.new(
      email: "invalid-email",
      password: "password123",
      name: "Test User"
    )
    expect(user).to_not be_valid
  end
end
