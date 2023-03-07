require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get /posts' do
    it 'renders index template with correct placeholder text for posts' do
      get '/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('List of All Posts')
    end
  end

  describe 'Get /posts/:id' do
    it 'renders show templates' do
      get '/posts/id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Posts Details')
    end
  end
end
