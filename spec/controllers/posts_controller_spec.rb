require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  context 'timeline displays friends posts' do
    let(:user) { User.create(id: '1', name: 'Nkiruka', email: 'nkiruka@example.com', password: 'nkiru123') }
    scenario 'show user posts' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      fill_in 'post_content', with: 'The launch of Microverse 2.0'
      click_button 'Save'
      visit root_path
      expect(page).to have_content('Microverse 2.0')
    end
  end
end
