# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with valid attributes" do
    user = User.create(
      email: "test@example.com",
      password: "password123",
      name: "Test User"
    )
    category = Category.new(
      name: "Test Category",
      user: user
    )
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    user = User.create(
      email: "test@example.com",
      password: "password123",
      name: "Test User"
    )
    category = Category.new(
      user: user
    )
    expect(category).to_not be_valid
  end

  it "calculates the total spent correctly" do
    user = User.create(
      email: "test@example.com",
      password: "password123",
      name: "Test User"
    )
    category = Category.create(
      name: "Test Category",
      user: user
    )
    Exchange.create(
      name: "Test Exchange 1",
      amount: 100,
      author: user,
      categories: [category]
    )
    Exchange.create(
      name: "Test Exchange 2",
      amount: 200,
      author: user,
      categories: [category]
    )
    expect(category.total_spent).to eq(300)
  end
end
