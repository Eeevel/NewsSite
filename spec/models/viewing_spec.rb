require 'rails_helper'

RSpec.describe Viewing, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
