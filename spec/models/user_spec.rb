require 'rails_helper'

Rspec.describe User, type: :model do
  subject {User.new(name: 'Nabeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio:'student', posts_counter: 0)}
  before {subject.save}

  context 'Test Validations' do
    it 'User is not valid without a name' do
      subject.name = nil 
      expect(subject).to_not be_valid
    end

    it 'User is valid with name' do
      expect(subject).to be_valid
    end
    
    it 'User is not valid with negative posts_counter' do
      Subject.posts_counter = -10
      expect(subject).to_not be_valid
    end  
    
    it 'User is valid if positive post_counter' do
      expect(subject).to be_valid
    end
  end

context 'Testing behaviour' do
  let(:user) { subject }

    before do
      5.times do
        Post.create!(author_id: user.id, title: 'Hello World', text: 'Text', comments_counter: 1, likes_counter: 1)
      end
    end

    it 'lists 3 recent posts' do
    expect(user.recent_posts.count).to eq 3
    end
  end
end