require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'Get /users' do
    it 'renders index template with correct placeholder text for users' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('List of All Users.')
    end
  end

  describe 'Get /users/:id' do
    it 'renders show templates' do
      get '/users/id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('User Details')
    end
  end
end
