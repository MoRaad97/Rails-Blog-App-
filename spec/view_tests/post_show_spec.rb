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
    @post  = Post.new(title: 'Post1', text: 'Post 1 text', comment_counter: 0, likes_counter: 0)
    @post.user_id = @user.id
    @post.save!
    
    @comment = Comment.new(text: 'my comment')
    @comment.user = @user
    @comment.post = @post    
    @comment.save!
    visit(user_post_path(@user.id, @post.id))
  end

  it 'shows post title' do
    expect(page).to have_content("#{@post.title}")
  end

  it 'shows the text of the post' do
    expect(page).to have_content("#{@post.text}")
  end
  
  it 'can see who wrote the post' do
    expect(page).to have_content("#{@post.user.name}")
  end

  it 'I can see how many comments a post has' do
    expect(page).to have_content("number on comments:#{@post.comment_counter}")
  end

  it 'I can see how many likes a post has' do
    expect(page).to have_content("number on likes:#{@post.likes_counter}")
  end

  it 'I can see how many likes a post has' do
    expect(page).to have_content("number on likes:#{@post.likes_counter}")
  end

  it 'show the username of the commenter' do
    expect(page).to have_content("#{@comment.user.name}")
  end
  
  it 'show the comment text of the commenter' do
    expect(page).to have_content("#{@comment.text}")
  end

end