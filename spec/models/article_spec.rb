require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:taggings) }
    it { should have_many(:tags) }
    it { should have_many(:ratings) }
    it { should have_many(:viewings) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:short_description) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:news_main_image) }
    it { should validate_presence_of(:region) }
    it { should validate_presence_of(:access_mask) }
    it { should validate_presence_of(:category) }
    it { should validate_inclusion_of(:category).in_array(%w[people technology culture politics sport religion economics auto]) }
    it { should validate_inclusion_of(:status).in_array(%w[inactive active published archived]) }
  end
end
