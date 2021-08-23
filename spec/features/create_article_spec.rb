require 'rails_helper'

RSpec.feature 'Create the article', type: :feature do
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
    visit '/users/sign_in'
    fill_in 'Email', with: 'test123@test123'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  describe 'correspondent creates the article' do
    it 'creates the article' do
      visit '/articles/new'
      fill_in 'Title', with: 'title'
      fill_in 'Short description', with: 'short description'
      find(:xpath, "//trix-editor[@input='article_body_trix_input_article']").click.set('body')
      fill_in 'All tags', with: 'test'
      attach_file('article_news_main_image', 'app/assets/images/default_avatar.jpg')
      select 'people', from: 'Category'
      fill_in 'Region', with: 'Belarus'
      select 'true', from: 'Important'
      select 'title', from: 'Access mask'
      click_button 'Create article'

      expect(page).to have_text('short description')
    end
  end
end
