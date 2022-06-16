require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index' do
    before(:each) do
        User.create(name: 'Thiago', 
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Test.', email: 't@t.com',
          password: '654321', posts_counter: 5, role: 0, confirmed_at: DateTime.now)
        User.create(name: 'Richard', 
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Test.', email: 'r@r.com',
          password: '123456', posts_counter: 5, role: 1, confirmed_at: DateTime.now)

      visit new_user_session_path

      fill_in 'Email', with: 'r@r.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content('Thiago')
      expect(page).to have_content('Richard')
    end

    it 'I can see the profile picture for each user' do
      expect(page).to have_selector('img', count: 2)
    end

    it "I can see the number of posts each user has written." do
      expect(page).to have_content('Posts: 5')
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      user = User.all.first
      click_link(user.name)
      expect(page.current_path).to eql(user_path(id: user.id))
    end
  end
end