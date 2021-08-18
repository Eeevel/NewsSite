require 'rails_helper'

RSpec.describe RssFeed, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:link) }
  end
end
