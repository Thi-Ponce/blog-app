require 'rails_helper'

RSpec.describe 'Posts show', type: :system, js: true do
  before :each do
    @test = User.create(id: 1, name: 'Thiago', bio: 'testing', password: '123456',
                        email: 't@t.com', posts_counter: 4, confirmed_at: Time.now)

    @test1 = Post.create(id: 1, author_id: 1, comments_counter: 2, likes_counter: 5,
                         title: 'Hello1', text: 'This is my first test', created_at: Time.now)

    @test2 = Post.create(id: 2, author_id: 1, comments_counter: 0, likes_counter: 5,
                         title: 'Hello2', text: 'This is my second test', created_at: Time.now)

    @test3 = Post.create(id: 3, author_id: 1, comments_counter: 0, likes_counter: 5,
                         title: 'Hello3', text: 'This is my third test', created_at: Time.now)

    @comment1 = @test1.comments.create(text: 'testing1', author_id: 1)
    @comment2 = @test1.comments.create(text: 'vtesting2', author_id: 1)

    @like = @test1.likes.create(author_id: 14)

    visit new_user_session_path
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_on 'Thiago'
    click_on 'Hello1'
  end

  describe 'show page for one post to one user' do
    it "I can see the post's title." do
      expect(page).to have_content('Hello1')
      expect(page).to have_content('Hello2')
      expect(page).to have_content('Hello3')
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content('Thiago')
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('comments: 2')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content('likes: 1')
    end

    it 'I can see the post body.' do
      expect(page).to have_content('This is my first test')
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Thiago')
      expect(page).to have_content('Thiago')
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('testing1')
      expect(page).to have_content('testing2')
    end
  end
end
