require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      get '/posts/index'
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get '/posts/index'
      expect(response.body).to include('Many User Posts')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      get '/posts/show'
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get '/posts/show'
      expect(response.body).to include('Signle Post')
    end
  end
end
