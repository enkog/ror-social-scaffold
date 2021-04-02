require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Nkiruka',
                        email: 'nkiruka@example.com',
                        password: 'helloworld')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { expect(described_class.reflect_on_association(:posts).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:friendships).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:friends).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:inverse_friendships).macro).to eq(:has_many) }
  end
end
