require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
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

  describe 'GET #show' do
    before do
      get :show, params: { id: 'people' }
    end

    it 'renders the show template' do
      is_expected.to render_template :show
    end

    it 'returns the category' do
      expect(assigns(:category)).to eq('people')
    end

    it 'returns the articles' do
      expect(assigns(:articles)).to match_array([article])
    end
  end
end
