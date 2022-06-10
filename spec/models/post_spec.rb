require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.create(name: 'Aymeric', photo: '', bio: 'Lord of Ishgard')
    Post.new(author: user, title: 'For the citizens of the Holy See', text: 'Regarding the end of the Dragonsong war')
  end
  before { subject.save }

  it 'does not validate without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'does not validate without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'does not validate when a title is blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'does not validate when a title exceeds 250char' do
    subject.title = 'Hear, Feel, Think' * 251
    expect(subject).to_not be_valid
  end

  it 'does not validate without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'does not validate if likes_counter is negative' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'does not validate if comments_counter is negative' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end
end