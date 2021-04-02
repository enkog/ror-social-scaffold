require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:user1) { User.create(name: 'user1', email: 'user1@example.com', password: 'user123') }
    let(:post1) { Post.create(user_id: user1.id, content: 'This is my first post') }
  let(:comment) { Comment.create(user_id: user1.id, post_id: post1.id, content: 'This is the first comment') }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without a content' do
    comment.content = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a user_id' do
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post_id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end

  describe 'Associations' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:post).macro).to eq(:belongs_to) }
  end
end
