require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'Haurchefant', photo: '', bio: 'In loving memory of our dear partner')
    post = Post.new(author: user, title: 'Do not look at me so', text: 'A smile better suits a hero')
    Like.new(author: user, post:)
  end

  before { subject.save }

  it 'does not validate without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'does not validate without an author' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
