require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  before :each do
    create(:user, role: 'correspondent')
  end

  describe 'user log in' do
    it 'signs @user in' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test123@test123'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(current_path).to eq('/en')
      expect(page).to have_text('Signed in successfully.')
    end
  end
end
