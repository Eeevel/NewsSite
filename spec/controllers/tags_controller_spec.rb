require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:article) { create(:article) }
  let(:tag) { create(:tag, articles: [article]) }

  describe 'GET #show' do
    before do
      get :show, params: { id: tag.name }
    end

    it 'renders the show template' do
      is_expected.to render_template :show
    end

    it 'returns the tag' do
      expect(assigns(:tag)).to eq(tag)
    end

    it 'returns the articles' do
      expect(assigns(:articles)).to match_array([article])
    end
  end
end
