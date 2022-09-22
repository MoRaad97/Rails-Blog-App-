require "rails_helper"

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter: 0) }
  
  before { subject.save}

it 'name should be present' do
  subject.name = nil 
  expect(subject).to_not be_valid 
end

it 'name length should be 2 or more characters' do
  subject.name = "n" 
  expect(subject).to_not be_valid 
end

it 'posts_counter should be 0 or more' do
  subject.posts_counter = nil
  expect(subject).to_not be_valid 
end

end