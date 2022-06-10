# require 'rails_helper'

# RSpec.describe 'Posts requests', type: :request do
#   describe 'tests for index posts' do
#     before(:all) do
#       @user = User.create(name: 'Tom', photo: '', bio: 'Teacher from Mexico.')
#       @post1 = Post.create(author: @user, title: 'Hello 1 (Tom)', text: 'This is my first post')
#       @post2 = Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
#     end

#     it 'Renders posts and give out the correct status' do
#       expect(response).to have_http_status(200)
#     end

#     it 'Renders the correct view' do
#       expect(response).to render_template(:index)
#     end
#   end

#   it 'Renders correct post data and give out the correct status' do
#     get user_post_path(user_id: 1, id: 1)
#     expect(response).to have_http_status(200)
#   end

#   it 'Renders Post #1 from user 1 and renders correct template' do
#     get user_post_path(user_id: 1, id: 1)
#     expect(response).to render_template(:show)
#   end
# end
