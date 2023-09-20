require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Rafio', email: 'rafio@gmail.com', password: '123456', password_confirmation: '123456')
    @category = @user.categories.create(name: 'Rent', icon: 'fas fa-home')
    visit new_user_session_path
    fill_in 'Email', with: 'rafio@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'signs users in' do
    expect(current_path).to eq('/')
  end

  #   it 'should include template text' do
  #     expect(page).to have_content('Signed in successfully')
  #   end

  it 'displays categories on the page' do
    visit categories_path
    expect(page).to have_content(@category.name)
    expect(page).to have_css("img[src='#{@category.icon}']")
    expect(page).to have_text(@category.created_at.strftime('%B %d, %Y'))
  end

  it 'displays category details' do
    visit categories_path
    click_link @category.name
    expect(current_path).to eq(category_path(@category))
    expect(page).to have_content(@category.name)
  end

  it 'navigates to add new category page' do
    visit categories_path
    click_link 'New Category'
    expect(current_path).to eq(new_category_path)
    expect(page).to have_content('New Category')
  end

  it 'a new category path' do
    visit new_category_path
    expect(page).to have_content('New Category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
    expect(page).to have_content('Back')
  end

  after(:all) do
    User.destroy_all
    Category.destroy_all
  end
end
