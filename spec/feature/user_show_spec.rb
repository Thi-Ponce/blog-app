require 'rails_helper'

RSpec.describe 'user_show', type: :feature do
  before(:each) do
    @user1 = User.create(id: 1, name: 'Thiago', email: 't@t.com', bio: 'test',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo', password: '654321', role: 1,
                         confirmed_at: DateTime.now)

    @user2 = User.create(id: 2, name: 'Richard', email: 'r@r.com', bio: 'test',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo', password: '123456', role: 0,
                         confirmed_at: DateTime.now)

    @first_post = Post.create(id: 1, author_id: 1, title: 'test1', text: 'text')
    @second_post = Post.create(id: 2, author_id: 1, title: 'test2', text: 'text')
    @third_post = Post.create(id: 3, author_id: 1, title: 'test3', text: 'text')

    visit new_user_session_path
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '654321'
    click_button 'Log in'
    user = User.all.first
    click_link(user.name)
  end

  it 'I can see the user\'s profile picture.' do
    expect(page.html).to include('img-user')
  end

  it 'Should show user\'s name' do
    expect(page).to have_content('Thiago')
  end

  it 'can see the user\'s number of posts' do
    user = User.all.first
    expect(page).to have_content("Posts: #{user.posts_counter}")
  end

  it 'can see the user\'s bio' do
    user = User.all.first
    expect(page).to have_content(user.bio)
  end

  it 'Should show user\'s last 3 posts' do
    expect(page).to have_content('test3')
    expect(page).to have_content('test2')
    expect(page).to have_content('test1')
  end

  it 'can see a button that lets the user see all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to the post\'s page when a post is clicked' do
    post = Post.all.second
    click_link(post.title)
    expect(page.current_path).to eql(user_post_path(user_id: 1, id: 2))
  end

  it 'redirects to the user\'s posts page when the button See all posts is clicked' do
    user = User.all.first
    click_link('See all posts')
    expect(page.current_path).to eql(user_posts_path(user_id: user.id))
  end
end
