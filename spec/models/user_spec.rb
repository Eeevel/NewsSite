require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
    it { should have_many(:ratings) }
    it { should have_many(:viewings) }
    it { should have_many(:subscriptions) }
    it { should have_many(:reports) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:avatar) }
  end

  describe '#full_name' do
    let(:user) { User.new(first_name: 'First', last_name: 'Last') }

    it 'should return a full name' do
      expect(user.full_name).to eq('First Last')
    end
  end
end
