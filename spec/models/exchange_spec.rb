# spec/models/exchange_spec.rb

require 'rails_helper'

RSpec.describe Exchange, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User'
    )
    category = Category.create(
      name: 'Test Category',
      user:
    )
    exchange = Exchange.new(
      name: 'Test Exchange',
      author: user,
      categories: [category],
      amount: 100
    )
    expect(exchange).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User'
    )
    category = Category.create(
      name: 'Test Category',
      user:
    )
    exchange = Exchange.new(
      author: user,
      categories: [category],
      amount: 100
    )
    expect(exchange).to_not be_valid
  end

  it 'is not valid without selecting at least one category' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User'
    )
    exchange = Exchange.new(
      name: 'Test Exchange',
      author: user,
      amount: 100
    )
    expect(exchange).to_not be_valid
  end

  it 'is not valid without an amount' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User'
    )
    category = Category.create(
      name: 'Test Category',
      user:
    )
    exchange = Exchange.new(
      name: 'Test Exchange',
      author: user,
      categories: [category]
    )
    expect(exchange).to_not be_valid
  end
end
