require 'rails_helper'
require 'capybara/rspec'

RSpec.describe CommentsController, type: :feature do
  context 'Comments management' do
    before :each do
      user = User.create(id: '1', name: 'Nkiruka', email: 'nkiruka@example.com', password: 'nkiru123')
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit root_path
      fill_in 'post_content', with: 'Testing Posts'
      click_button 'Save'
    end

    it 'creates comment' do
      visit root_path
      fill_in 'comment_content', with: 'first comment'
      click_button 'Comment'
      sleep(2)
      expect(page).to have_content('Comment was successfully created')
    end
  end
end
