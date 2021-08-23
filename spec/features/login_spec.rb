require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  before :each do
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
