require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:article) { create(:article) }

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
