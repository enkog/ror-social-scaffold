require 'rails_helper'

RSpec.describe UsersController, type: :feature do
  context 'GET controller views' do
    let(:user1) { User.create(id: '1', name: 'Nkiruka', email: 'nkiruka@example.com', password: 'nkiruka123') }
    let(:user2) { User.create(id: '2', name: 'Emeka', email: 'emeka@example.com', password: 'emeka123') }

    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button 'Log in'
    end

    it 'Get #index' do
      visit users_path
      users = User.all
      expect(users).to eq([user1, user2])
    end

    it 'Get #show' do
      user = User.find(user1.id)
      expect(user).to eq(user1)
    end
  end
end
