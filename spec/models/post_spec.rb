require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Nabeel', posts_counter: 1) }
  subject do
    Post.new(author_id: user.id, title: 'Hello', text: 'This is my post', comments_counter: 1, likes_counter: 1)
  end

  before { subject.save }

  it 'increments the user posts counter' do
    user.increment!(:posts_counter)
    expect(user.posts_counter).to eq(2)
  end

  context 'Testing validations' do
    it 'Title should be invalid with a nil value' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'CommentCounter should be integer and greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likesCounter must be an integer greater than or equals to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'Testing behaviour' do
    before do
      10.times do
        Comment.create(author_id: user.id, post_id: subject.id, text:
     'Text')
      end
    end

    it 'lists the most recent 5 posts' do
      expect(subject.recent_comments.length).to eq 5
    end
  end
end
