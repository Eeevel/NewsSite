require 'rails_helper'

RSpec.describe CreateCommentsService, type: :model do
  describe '#call' do
    let(:params) do
      {
        body: 'test'
      }
    end

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

    it 'creates the comment' do
      result = CreateCommentsService.call(params, user, article)
      expect(result).to eq(true)
    end
  end
end
