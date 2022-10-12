require 'rails_helper'

RSpec.describe 'user_show', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
    @user = User.create(
      name: 'Mohammed',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Programmer from Iraq.',
      posts_counter: 0
    )
    @post1  = Post.new(title: 'Post1', text: 'Post 1 text', comment_counter: 0, likes_counter: 0)
    @post1.user_id = @user.id
    @post1.save!
    
    @post2  = Post.new(title: 'Post2', text: 'Post 2 text', comment_counter: 0, likes_counter: 0)
    @post2.user_id = @user.id
    @post2.save!
    
    @post3  = Post.new(title: 'Post3', text: 'Post 3 text', comment_counter: 0, likes_counter: 0)
    @post3.user_id = @user.id
    @post3.save!
    visit(user_posts_path(@user.id))
  end

  it 'shows user username' do
    expect(page).to have_content("#{@user.name}")
  end

  it 'shows the photo of the users' do
    expect(page.html).to include('User Img')
  end

  it 'shows the number of post of the user' do
    expect(page).to have_content("#{@user.posts_counter}")
  end

  it 'shows the title of each post' do
    post1 = Post.first
    post3 = Post.last
    expect(page).to have_content("#{post1.title}")
    expect(page).to have_content("#{post3.title}")
  end

  it 'shows the text of the posts' do
    post1 = Post.first
    post3 = Post.last
    expect(page).to have_content("#{post1.text}")
    expect(page).to have_content("#{post3.text}")
  end

  it 'I can see how many comments a post has' do
    post = Post.first
    expect(page).to have_content("number on comments:#{post.comment_counter}")
  end

  it 'I can see how many likes a post has' do
    post = Post.first
    expect(page).to have_content("number on likes:#{post.likes_counter}")
  end

  it 'should redirect to post show page when is clicked' do
    user = User.first
    post = Post.first
    click_link("#{post.title}")
    expect(page.current_path).to eql(user_post_path(user.id, post.id))
  end

end