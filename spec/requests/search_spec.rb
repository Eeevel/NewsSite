require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /index' do
    before do
      get search_index_path, params: { query: 'test' }
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
