require 'rails_helper'

RSpec.describe 'Category Transactions Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Rafio', email: 'rafio@gmail.com', password: '123456', password_confirmation: '123456')
    @category = @user.categories.create(name: 'Rent', icon: 'fas fa-home')
    @exchange1 = @category.exchanges.create(name: 'Rent Payment', amount: 1000)
    @exchange2 = @category.exchanges.create(name: 'Utility Bill', amount: 200)
    visit new_user_session_path
    fill_in 'Email', with: 'rafio@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'displays category name and total exchange amount' do
    visit category_path(@category)
    expect(page).to have_content(@category.name)
  end

  it 'displays exchange items' do
    visit category_path(@category)
    expect(page).to have_content(@category.name)
  end

  it 'navigates to exchange page' do
    visit category_path(@category)
    expect(page).to have_content(@category.name)
    expect(page).to have_content('transactions')
  end

  it 'navigates to create new exchange page' do
    visit category_path(@category)
    click_link 'Create New Exchange'
    expect(current_path).to eq(new_category_exchange_path(@category))
  end

  after(:all) do
    User.destroy_all
    Category.destroy_all
    Exchange.destroy_all
  end
end