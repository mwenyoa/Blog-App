require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns reponse status  of http success/ok' do
      get users_index_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      get users_index_path
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get users_index_path
      expect(response.body).to include('This page will list multiple blop app users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get users_show_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      get users_show_path
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get users_show_path
      expect(response.body).to include('Signle User')
    end
  end
end
