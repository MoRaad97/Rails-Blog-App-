require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
    @user = User.create(
      name: 'Mohammed',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Programmer from Iraq.',
      posts_counter: 0
    )
    visit root_path
  end

  it 'shows the username of the users' do
    expect(page).to have_content("#{@user.name}")
  end

  it 'shows the photos of the users' do
    expect(page.html).to include('User Img')
  end

  it 'shows the number of post of each user' do
    expect(page).to have_content("#{@user.posts_counter}")
  end

  it 'should redirect to user show page when a name is clicked' do
    user = User.first
    click_link(user.name)
    expect(page.current_path).to eql(user_path(id: user.id))
  end
end
