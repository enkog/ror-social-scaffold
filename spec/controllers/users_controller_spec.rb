require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'populate users' do
    it 'GET #index' do
      get :index
      expect(response).to be_successful
    end

    it 'GET #show' do
      @user = User.new(id: '1', name: 'nkiruka', password: 'helloworld').save
      get :show, params: { id: '1' }
      expect(response).to be_successful
    end
  end
end
