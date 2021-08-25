require 'rails_helper'

RSpec.describe CreateCommentsService, type: :model do
  describe '#call' do
    let(:params) { { body: 'test' } }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    it 'creates the comment' do
      result = CreateCommentsService.call(params, user, article)
      expect(result).to eq(true)
    end
  end
end
