require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@example.com', password: 'user123') }
  let(:post1) { Post.create(user_id: user1.id, content: 'This is my first post') }
  let(:like) { Like.create(user_id: user1.id, post_id: post1.id) }

  it 'is valid with valid attributes' do
    expect(like).to be_valid
  end

  it 'is not valid without a user_id' do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it 'is not valid without a post_id' do
    like.post_id = nil
    expect(like).to_not be_valid
  end

  describe 'Associations' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:post).macro).to eq(:belongs_to) }
  end
end
