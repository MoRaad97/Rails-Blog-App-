require "rails_helper"

RSpec.describe Post, type: :model do
  subject {
    Post.new(title: 'Tom', text: 'Post text',
             comment_counter: 0, likes_counter: 0)
  }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length should not exceed 250' do
    subject.title = "string" * 200
    expect(subject).to_not be_valid
  end

  it 'comment_counter should be 0 or more' do
    subject.comment_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be 0 or more' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
end
