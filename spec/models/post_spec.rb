require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@example.com', password: 'user123') }
  let(:post) { Post.create(user_id: user1.id, content: 'This is my first post') }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a content' do
    post.content = nil
    expect(post).to_not be_valid
  end

  describe 'Associations' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many) }
  end
end
