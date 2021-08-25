require 'rails_helper'

RSpec.describe DestroyCommentsService, type: :model do
  describe '#call' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:comment) { create(:comment, user: user, article: article) }
    let(:id) { comment.id }

    it 'destroys the comment' do
      DestroyCommentsService.call(id, user, article)
      expect(article.comments).to match_array([])
    end
  end
end
