require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@example.com', password: 'user123') }
  let(:user2) { User.create(name: 'user2', email: 'user2@example.com', password: 'user123') }
  let(:friendship) { Friendship.create(user_id: user1.id, friend_id: user2.id, confirmed: 'true') }

  it 'is valid with valid attributes' do
    expect(friendship).to be_valid
  end

  it 'is not valid without a user_id' do
    friendship.user_id = nil
    expect(friendship).to_not be_valid
  end

  it 'is not valid without a friend_id' do
    friendship.friend_id = nil
    expect(friendship).to_not be_valid
  end
end
