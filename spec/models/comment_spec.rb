require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'Graha Tia', photo: '', bio: 'Crystal exharc')
    post = Post.new(author: user, title: 'Stand tall my friends', text: 'Our journey will never end')
    Comment.new(author: user, post:, text: 'May those who walked before, lead those who walk after')
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

  it 'does not validate without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end