require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:parameter) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:frequency) }
  end
end
