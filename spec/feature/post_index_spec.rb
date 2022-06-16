require 'rails_helper'
RSpec.describe 'Posts', type: :system do
  describe 'Index' do
    before(:each) do
      @user1 = User.create(id: 1, name: 'Thiago', email: 't@t.com', password: '123456',
                           confirmed_at: Time.now, posts_counter: 0)
      @user2 = User.create(id: 2, name: 'Richard', email: 'r@r.com', password: '123456',
                           confirmed_at: Time.now, posts_counter: 0)
      @post1 = Post.create(id: 1, author_id: 1, title: 'post1', text: 'testing post')
      @post2 = Post.create(id: 2, author_id: 1, title: 'post2', text: 'testing post2')
      @post3 = Post.create(id: 3, author_id: 1, title: 'post3', text: 'testing post3')
      @comment1 = @post1.comments.create(author_id: 2, text: 'test1')
      @comment2 = @post1.comments.create(author_id: 2, text: 'test2')
      @comment3 = @post1.comments.create(author_id: 2, text: 'test3')
      @comment4 = @post1.comments.create(author_id: 2, text: 'test4')
      @like = @post1.likes.create(author_id: 2)
      @like = @post1.likes.create(author_id: 2)
      visit new_user_session_path
      fill_in 'Email', with: 't@t.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Thiago'
      click_link 'See all posts'
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_selector('img')
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content('Thiago')
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Posts: 3')
    end
    it 'I can see a post\'s title.' do
      expect(page).to have_content('post1')
    end
    it 'I can see some of the post\'s body.' do
      expect(page).to have_content('testing post')
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_content('Comments: 4')
    end
    it 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 2')
    end
    it 'When I click on a post, it redirects me to that post\'s show page.' do
      click_on 'post1'
      expect(page.current_path).to eq('/users/1/posts/1')
    end
  end
end
