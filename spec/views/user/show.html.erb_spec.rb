require 'rails_helper'

RSpec.describe 'Users show view', type: :system do
  subject { User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from mexico.', posts_counter: 0) }

  before do
    @post1 = Post.create(author_id: subject.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0, likes_counter: 0)
  end

  it 'I can see the user\'s profile picture' do
    visit user_path(subject)
    expect(page).to have_selector('img')
  end

  it 'I can see the user\'s username' do
    visit user_path(subject)
    expect(page).to have_content(subject.name)
  end

  it 'I can see the number of posts the user has written' do
    visit user_path(subject)
    expect(page).to have_content(subject.posts_counter)
  end

  it 'I can see the user\'s bio' do
    visit user_path(subject)
    expect(page).to have_content(subject.bio)
  end

  it 'I can see the user\'s first 3 posts' do
    visit user_path(subject)
    expect(page).to have_content('Hello 1')
    expect(page).to have_content('Hello 2')
    expect(page).to have_content('Hello 3')
    expect(page).not_to have_content('Hello 4')
  end

  it 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(subject)
    click_button('See all posts')
    expect(page).to have_current_path(user_posts_path(subject))
  end

  it 'When I click a user\'s post, it redirects me to that post\'s show page' do
    visit user_path(subject)
    click_link(@post1.title)
    expect(page).to have_current_path(user_post_path(subject, @post1))
  end

  context 'When I click to see all posts,' do
    before { visit user_path(subject) }

    it "redirects me to the user's post's index page" do
      find_button('See all posts').click
      expect(page).to have_current_path(user_posts_path(subject))
    end
  end
end
