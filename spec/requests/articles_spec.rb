require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) do
    User.create do |u|
      u.email = 'test123@test123'
      u.password = '123456'
      u.first_name = 'Test'
      u.last_name = 'Test'
      u.nickname = 'Test'
      u.address = 'Belarus'
      u.date_of_birth = '1970-01-01'
      u.avatar = File.open('app/assets/images/default_avatar.jpg')
      u.role = 'correspondent'
      u.uid = ''
      u.provider = ''
      u.skip_confirmation!
    end
  end

  let(:redactor) do
    User.create do |u|
      u.email = 'test_redactor@test_redactor'
      u.password = '123456'
      u.first_name = 'Test'
      u.last_name = 'Test'
      u.nickname = 'Test'
      u.address = 'Belarus'
      u.date_of_birth = '1970-01-01'
      u.avatar = File.open('app/assets/images/default_avatar.jpg')
      u.role = 'redactor'
      u.uid = ''
      u.provider = ''
      u.skip_confirmation!
    end
  end

  let(:article) do
    Article.create do |a|
      a.title = 'test'
      a.short_description = 'test'
      a.body = 'test'
      a.news_main_image = File.open('app/assets/images/default_avatar.jpg')
      a.category = 'people'
      a.region = 'Belarus'
      a.status = 'published'
      a.important = true
      a.user = user
    end
  end

  let(:article_invalid_params) do
    {
      article: {
        title: 'test',
        short_description: 'test',
        body: 'test',
        all_tags: '',
        news_main_image: File.open('app/assets/images/default_avatar.jpg'),
        category: 'people',
        region: 'Belarus',
        status: 'inactive',
        important: true,
        access_mask: 'all_content',
        feedback: ''
      }
    }
  end

  describe 'GET /index' do
    before do
      get articles_path
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns articles' do
      expect(assigns(:articles)).to eq(Article.order('updated_at DESC'))
    end
  end

  describe 'GET /show' do
    before do
      get "/articles/#{article.id}"
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the article' do
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get '/articles/new'
    end

    it 'renders the new template' do
      expect(response).to render_template :new
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'invalid params' do
      before do
        sign_in user
        post '/articles', params: article_invalid_params
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end

      it 'is unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /edit' do
    before do
      sign_in redactor
      get "/articles/#{article.id}/edit"
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /update' do
    context 'invalid params' do
      before do
        sign_in redactor
        patch "/articles/#{article.id}", params: article_invalid_params
      end

      it 'renders the edit template' do
        expect(response).to render_template :edit
      end

      it 'is unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      sign_in redactor
      delete "/articles/#{article.id}"
    end

    it 'redirects to root path' do
      expect(response).to redirect_to root_path
    end
  end
end
