require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  let(:user_params) do
    {
      id: user.id,
      user: {
        email: 'test@test',
        password: '123456',
        first_name: 'Test123',
        last_name: 'Test',
        nickname: 'Test',
        address: 'Belarus',
        date_of_birth: '1970-01-01',
        avatar: File.open('app/assets/images/default_avatar.jpg'),
        uid: '',
        provider: ''
      }
    }
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'renders the index template' do
      is_expected.to render_template :index
    end

    it 'returns users' do
      expect(assigns(:users)).to match_array([user])
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: user.id }
    end

    it 'renders the show template' do
      is_expected.to render_template :show
    end

    it 'returns the user' do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: user.id }
    end

    it 'returns the user' do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'PATCH #update' do
    before do
      patch :update, params: { id: user.id, params: user_params }
      sign_in user
    end

    it 'updates the user and redirects' do
      expect(response).to be_redirect
    end
  end
end
