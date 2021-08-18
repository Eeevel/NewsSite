require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number) }
  end
end
